class AddCommonnessToGrammar < ActiveRecord::Migration[6.0]
  def change
    add_column :grammars, :commonness, :integer
  end
end
