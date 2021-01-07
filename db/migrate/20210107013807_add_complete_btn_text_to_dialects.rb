class AddCompleteBtnTextToDialects < ActiveRecord::Migration[6.0]
  def change
    add_column :dialects, :complete_btn_text, :string
  end
end
