class CreateGrammars < ActiveRecord::Migration[6.0]
  def change
    create_table :grammars do |t|
      t.string :description
      t.integer :position
      t.belongs_to :dialect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
