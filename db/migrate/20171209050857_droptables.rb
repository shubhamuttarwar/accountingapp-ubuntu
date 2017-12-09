class Droptables < ActiveRecord::Migration[5.1]
  def up
  	drop_table :invoicing_ledger_items
  	drop_table :invoicing_line_items
  	drop_table :invoicing_tax_rates
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  
end
