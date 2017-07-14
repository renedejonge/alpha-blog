class RenameTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :categories_tables, :categories
  end
end
