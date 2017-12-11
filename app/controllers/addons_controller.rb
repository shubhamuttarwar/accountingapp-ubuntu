class AddonsController < ApplicationController
	def show

    @project = Project.find(params[:project_id])
    @addon = @project.addons.find(params[:id])
    end

	def create
		@project = Project.find(params[:project_id])
		@addon = @project.addons.create(addons_params)
    flash[:success] = "Addon created successfuly."
		redirect_to customer_project_path(@project.customer_id, @project)
	end

  def edit
    @project = Project.find(params[:project_id])
    @addon = @project.addons.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @addon = @project.addons.update(addons_params)
    flash[:success]= "Addon was updated succesfully."
    redirect_to customer_project_path(@project.customer_id,@project)
  end
    


     def destroy
     	@project = Project.find(params[:project_id])
    	@addon = @project.addons.find(params[:id])
    	@addon.destroy
      flash[:danger]="Addon was deleted succesfully."
    	redirect_to customer_project_path(@project.customer_id, @project)
    end


	private

	def addons_params
		params.require(:addon).permit(:service,:description,:price)
	end
end
