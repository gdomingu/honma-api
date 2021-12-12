class AddCategoryToPlaceInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :place_infos, :category, :string
  end
end
