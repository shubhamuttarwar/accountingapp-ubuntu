class OrderPdf < Prawn::Document
	def initialize(project, customer, addons)
		super(top_margin: 70 )
		@project = project
		@customer = customer
		@addon = addons
		order_number
		line_items
	end

	def order_number
		text "Order for \##{@customer.name.upcase}", size: 20, style: :bold
	end

	def line_items
		move_down 20
		table line_items_rows
	end

	def line_items_rows
		[["Project Title","Description","Total Price","Starting Date","Ending Date"]] + 
		@project.line_items.map do |item|
			[item.jname,item.jdescription,item.price,item.start_time,item.end_time]
		end
	end
end