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
    @addons = @project.addons.all

    respond_to do |format|
      format.html
      format.json 
      format.pdf {render template: 'projects/order', 
        pdf: "Order_#{@customer.name.downcase}_#{@customer.lastname.downcase}", 
        layout: 'pdf.html', 
        :page_size => "Letter"}
      end

    @skip_footer = true
    end

  def create
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.build(project_params)

    if @project.save
      flash[:success] = "Project was created successfully."
      redirect_to customer_projects_path(@customer)
    else
      render 'customers/show'
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
    flash[:success] ="Project was updated successfully."
    redirect_to customer_projects_path
  end
    
    def destroy
    	@customer = Customer.find(params[:customer_id])
    	@project = @customer.projects.find(params[:id])
    	@project.destroy
      flash[:danger] = "Project was deleted successfully."
    	redirect_to customer_path(@customer)
    end

  def ProjectCalendar
   
  end

  def totalsales
    beginning_of_month = Date.today.beginning_of_month
    end_of_month = Date.today.end_of_month
    @project = Project.where("end_time >= ? AND end_time <= ? AND project_status = ?", beginning_of_month,end_of_month,true).paginate(:page => params[:page], per_page: 7).order("created_at DESC")
    @sum_of_addons = 0

    respond_to do |format|
      format.html
      format.json 
      format.pdf {render template: 'projects/monthly_sales', 
        pdf: "Projects_for_#{Date::MONTHNAMES[Date.today.month]}", 
        layout: 'pdf.html', 
        :page_size => "Letter"}
      end
  end

  private
    def project_params
      params.require(:project).permit(:jname, :jdescription, :price, :start_time, :end_time,:project_status)
    end
end
