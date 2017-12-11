class CustomersController < ApplicationController
	#http_basic_authenticate_with name: "shubham", password: "shubham09", except: [:index,:show]
    def index
    	@customer = Customer.search(params[:search])
    end

    def show
    	@customer = Customer.find(params[:id])
    	@project = @customer.projects.build
    end

	def new
		@customer = Customer.new
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def create
		@customer = Customer.new(customer_params)

		if @customer.save
			redirect_to customers_path
		else
			render 'new'
		end
	end

	def update
		@customer = Customer.find(params[:id])

		if @customer.update(customer_params)
			redirect_to customers_path
		else
			render 'edit'
		end
	end
    
    def destroy
    	@customer = Customer.find(params[:id])
    	@customer.destroy

    	redirect_to customers_path
    end

	private

	def customer_params
		params.require(:customer).permit(:name,:lastname,:phone,:address,:email)  
	end

end
