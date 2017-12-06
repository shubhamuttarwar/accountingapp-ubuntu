module ApplicationHelper

	def CompleteOrNot(x)
		x ? "Completed" : "In Progress"
	end

	def currency(price)
		number_to_currency(price, options = {:unit => '₹'})
	end
end
