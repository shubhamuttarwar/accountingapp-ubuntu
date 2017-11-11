class ProjectsController < ApplicationController
	def index
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.all
  end

  def projectscalendar
    first_of_month = Date.current.beginning_of_month
    last_of_month = Date.current.end_of_month
    @projects = Project.where('start_time BETWEEN ? AND ?', first_of_month, last_of_month) 
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    if :end_time > :start_time
       @project = @customer.projects.create(project_params)
    else
      flash[:error] = "The END DATE cannot be earlier than the START DATE!"
    end
    redirect_to customer_path(@customer)
      
   
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
      params.require(:project).permit(:jname, :jdescription, :price, :start_time, :end_time)
    end
end
