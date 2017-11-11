class ProjectsController < ApplicationController
	def index
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.all
  end

  def projectscalendar
    first_of_month = Date.current.beginning_of_month
    last_of_month = Date.current.end_of_month
    @projects_full = Project.where('start_time BETWEEN ? AND ?', first_of_month, last_of_month)
    @projects = @projects_full.where('projects.Project_Status = ?', false)
    @complete_projects = @projects_full.where('projects.Project_Status = ?', true) 
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
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
    @project = @customer.projects.update(project_params)
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
  private
    def project_params
      params.require(:project).permit(:jname, :jdescription, :price, :start_time, :end_time,:Project_Status)
    end
end
