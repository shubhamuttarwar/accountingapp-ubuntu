class ProjectsController < ApplicationController
	def index
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.all.paginate(:page => params[:page], per_page: 7)
  end

  def projectscalendar
    first_of_month = Date.current.beginning_of_month
    last_of_month = Date.current.end_of_month
    @projects_full = Project.where('start_time BETWEEN ? AND ?', first_of_month, last_of_month)
    @projects = @projects_full.where('project_status = ?', false)
    @complete_projects = @projects_full.where('project_status = ?', true) 
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
    @addons = @project.addons

    respond_to do |format|
      format.html
      format.json 
      format.pdf {render template: 'projects/order', pdf: 'Order', layout: 'pdf.html', :page_size => "Letter"}
      end

    @skip_footer = true
    end

  def create
    @customer = Customer.find(params[:customer_id])
    end_time = params[:end_time]
    start_time = params[:start_time]
    if ((end_time.to_i - start_time.to_i)/86400).to_i >= 0 #86400 is the numbers of seconds in one day
       @project = @customer.projects.create(project_params)
       redirect_to customer_projects_path(@customer)
    else
      flash[:error] = "The END DATE cannot be earlier than the START DATE!"
      redirect_to customer_path(@customer)
    end
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
    @project.update(project_params)
    redirect_to customer_projects_path
  end
    
    def destroy
    	@customer = Customer.find(params[:customer_id])
    	@project = @customer.projects.find(params[:id])
    	@project.destroy
    	redirect_to customer_path(@customer)
    end

  def ProjectCalendar
   
  end

  def totalsales
    beginning_of_month = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month
    @project = Project.where("end_time >= ? AND end_time <= ? AND project_status = ?", beginning_of_month,end_of_month,true).paginate(:page => params[:page], per_page: 10)
    @sum_of_addons = 0
  end

  private
    def project_params
      params.require(:project).permit(:jname, :jdescription, :price, :start_time, :end_time,:project_status)
    end
end
