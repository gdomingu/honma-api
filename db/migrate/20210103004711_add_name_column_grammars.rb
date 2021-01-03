class AddNameColumnGrammars < ActiveRecord::Migration[6.0]
  def change
    add_column :grammars, :label, :string
  end
end
