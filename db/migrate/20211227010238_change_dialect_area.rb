class ChangeDialectArea < ActiveRecord::Migration[6.0]
  def change
    change_column :dialects, :area, 'integer USING CAST(area AS integer)'
  end
end