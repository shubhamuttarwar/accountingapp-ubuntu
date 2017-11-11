class AddstatusToProjects < ActiveRecord::Migration[5.1]
  def change
  	add_column :projects, :Project_Status , :Boolean
  end
end
