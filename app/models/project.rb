class Project < ApplicationRecord
  belongs_to :customer
  has_many :addons

  # validates :jname, presence: true, length: {minimum: 5}
  # validates :jdescription, presence: true, length: {minimum: 5}
  # validates :price, presence: true
  # validates :start_time, presence: true
  # validates :end_time, presence: true
  # validates :Project_Status, presence: true 
end
