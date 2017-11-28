class AddLastnameToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :lastname, :string
  end
end
