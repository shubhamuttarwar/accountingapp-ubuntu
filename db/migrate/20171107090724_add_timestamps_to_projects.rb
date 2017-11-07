class AddTimestampsToProjects < ActiveRecord::Migration[5.1]
  def change
  	add_column :projects, :start_time, :date
  	add_column :projects, :end_time, :date
  end
end
