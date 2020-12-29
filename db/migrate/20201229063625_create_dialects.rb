class CreateDialects < ActiveRecord::Migration[6.0]
  def change
    create_table :dialects do |t|
      t.string :name_en
      t.string :name_jp

      t.timestamps
    end
  end
end
