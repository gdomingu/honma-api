class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text :tokyo
      t.text :answer
      t.references :grammar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
