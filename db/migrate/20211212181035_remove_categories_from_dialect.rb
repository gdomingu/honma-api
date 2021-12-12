class RemoveCategoriesFromDialect < ActiveRecord::Migration[6.0]
  def change
    remove_column :dialects, :categories, :string
  end
end
