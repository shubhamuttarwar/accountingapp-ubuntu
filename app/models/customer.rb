class Customer < ApplicationRecord

	has_many :projects, dependent: :destroy
	
	validates :name, presence: true, length: {minimum: 3}
	validates :lastname, presence: true, length: {minimum: 3}
	validates :phone, presence: true, length: {minimum: 10}
	validates :address, presence: true, length: {minimum: 30}
	validates :email, presence: true

    def self.search(search)
    	if search
    		Customer.where("lastname ILIKE ? OR name ILIKE ?", "%#{search}%", "%#{search}")
    	else
    		Customer.all.order("created_at DESC").limit(5)
    	end
    end

end
