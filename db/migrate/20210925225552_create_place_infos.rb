class CreatePlaceInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :place_infos do |t|
      t.string :name_jp
      t.string :name_en
      t.string :img_url
      t.float :latitude
      t.float :longtitude
      t.references :dialect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
