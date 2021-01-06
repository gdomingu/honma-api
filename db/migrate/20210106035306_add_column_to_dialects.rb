class AddColumnToDialects < ActiveRecord::Migration[6.0]
  def change
    add_column :dialects, :start_btn_text, :string
    add_column :dialects, :next_btn_text, :string
  end
end
