class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.references :customer, foreign_key: true
      t.string :jname
      t.text :jdescription
      t.integer :price

      t.timestamps
    end
  end
end
