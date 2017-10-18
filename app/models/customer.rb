class Customer < ApplicationRecord

	has_many :projects, dependent: :destroy
	
	validates :name, presence: true, length: {minimum: 5}
	validates :phone, presence: true, length: {minimum: 10}
	validates :address, presence: true, length: {minimum: 30}
	validates :email, presence: true


end
