class CreateAddons < ActiveRecord::Migration[5.1]
  def change
    create_table :addons do |t|
      t.string :service
      t.integer :price
      t.text :description
      t.references :project

      t.timestamps
    end
  end
end
