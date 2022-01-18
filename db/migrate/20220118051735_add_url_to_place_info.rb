class AddUrlToPlaceInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :place_infos, :url, :string
  end
end
