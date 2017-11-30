class AddprojectstatustoProjects < ActiveRecord::Migration[5.1]
  def change
  	remove_column :projects, :Project_Status, :Boolean
  	add_column :projects, :project_status, :Boolean
  end
end
