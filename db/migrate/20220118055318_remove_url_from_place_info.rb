class RemoveUrlFromPlaceInfo < ActiveRecord::Migration[6.1]
  def change
    remove_column :place_infos, :url, :string
  end
end
