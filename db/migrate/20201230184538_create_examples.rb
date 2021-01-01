class CreateExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :examples do |t|
      t.string :language
      t.string :sentence1
      t.string :sentence2
      t.string :clip_name
      t.references :grammar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
