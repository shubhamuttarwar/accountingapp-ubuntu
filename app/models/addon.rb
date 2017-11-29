class Addon < ApplicationRecord
	belongs_to :project

	validates :service,presence: true, length: {minimum: 5}
	validates :description, presence: true, length: {minimum: 5}
	validates :price, presence: true
end
