class AddDescriptionToPlaceInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :place_infos, :description, :text
  end
end
