class ProjectsController < ApplicationController
	def create
    @customer = Customer.find(params[:customer_id])
    @project = @customer.projects.create(project_params)
    redirect_to customer_path(@customer)
  end
    
    def destroy
    	@customer = Customer.find(params[:customer_id])
    	@project = @customer.projects.find(params[:id])
    	@project.destroy
    	redirect_to customer_path(@customer)
    end
  private
    def project_params
      params.require(:project).permit(:jname, :jdescription, :price)
    end
end
