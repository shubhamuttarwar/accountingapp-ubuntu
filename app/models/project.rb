class Project < ApplicationRecord
  belongs_to :customer
  has_many :addons
end
