class Project < ApplicationRecord
  belongs_to :customer
  has_many :addons

  validates :jname, presence: true, length: {minimum: 5}
  validates :jdescription, presence: true, length: {minimum: 5}
  validates :price, presence: true
  validates :start_time, presence: true 
  validates :end_time, presence: true
  validates :project_status,inclusion: { in: [ true, false ] }
  validate :start_time_before_end_time

  private

  def start_time_before_end_time
  	return unless start_time and end_time
  	errors.add(:start_time, "must be before end time") unless start_time < end_time 
  end		
  end

 