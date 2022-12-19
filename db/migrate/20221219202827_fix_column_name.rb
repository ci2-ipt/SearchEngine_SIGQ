class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :categories, :categoryName, :name
  end
end
