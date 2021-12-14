class AddDescriptionToDialect < ActiveRecord::Migration[6.0]
  def change
    add_column :dialects, :description, :text
  end
end
