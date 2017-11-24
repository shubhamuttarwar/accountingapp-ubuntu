class AddonsController < ApplicationController
	def index
	end

	def new
	end

	def create
		@project = Project.find(params[:project_id])
		@addon = @project.addons.create(addons_params)
		redirect_to customer_project_path(@project.customer_id, @project)
	end
    

     def destroy
     	@project = Project.find(params[:project_id])
    	@addon = @project.addons.find(params[:id])
    	@addon.destroy
    	redirect_to customer_project_path(@project.customer_id, @project)
    end


	private

	def addons_params
		params.require(:addon).permit(:service,:description,:price)
	end
end
