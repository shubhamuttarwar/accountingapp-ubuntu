module ApplicationHelper

	def CompleteOrNot(x)
		x ? "Completed" : "In Progress"
	end

	def currency(price)
		return "#{price}₹"
	end
end
