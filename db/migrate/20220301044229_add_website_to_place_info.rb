class AddWebsiteToPlaceInfo < ActiveRecord::Migration[6.1]
  def change
    add_column :place_infos, :website, :string
  end
end
