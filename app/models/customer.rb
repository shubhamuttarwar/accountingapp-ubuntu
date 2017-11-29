class Customer < ApplicationRecord

	has_many :projects, dependent: :destroy
	
	validates :name, presence: true, length: {minimum: 5}
	validates :lastname, presence: true, length: {minimum: 5}
	validates :phone, presence: true, length: {minimum: 10}
	validates :address, presence: true, length: {minimum: 30}
	validates :email, presence: true

    def self.search(search)
    	if search
    		Customer.where("lastname LIKE ?", "%#{search}%")
    	else
    		Customer.all
    	end
    end

end
