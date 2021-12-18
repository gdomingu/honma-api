class AddAreaToDialect < ActiveRecord::Migration[6.0]
  def change
    add_column :dialects, :area, :string
  end
end
