require 'rails_helper'
require 'faker'

describe HonmaApiSchema do
  describe 'place_info' do
    let(:current_user) { create(:user) }
    let(:context) do
      {
        current_user: current_user
      }
    end
    let(:dialect) { create(:dialect)}

    context "querying by dialect id" do
      let(:query) {
        <<-GRAPHQL
          query {
            placeInfos(dialectId: #{dialect.id}, category: "Scenery") {
              id
              nameEn
              nameJp
              category
              imageUrls
              website
              address
              description
            }
          }
        GRAPHQL
      }
          
      it "returns all place infos associated to that particular dialect and category" do   
        place_info1 = PlaceInfo.find_or_create_by!(dialect_id: dialect.id, name_jp: "縮景園", name_en: "Shukkeien", category: "Scenery", description: Faker::Lorem.paragraph)
        place_info2 = PlaceInfo.find_or_create_by!(dialect_id: dialect.id, name_jp: "千光寺", name_en: "Senko-ji", category: "Scenery", description: Faker::Lorem.paragraph)

        expected_result = 
          [
            {
              'id' => place_info1.id.to_s,
              'nameEn' => place_info1.name_en,
              'nameJp' => place_info1.name_jp,
              'category' => place_info1.category,
              'imageUrls' => nil,
              'website' => nil,
              'address' => nil,
              'description' => place_info1.description,
            },
            {
              'id' => place_info2.id.to_s,
              'nameEn' => place_info2.name_en,
              'nameJp' => place_info2.name_jp,
              'category' => place_info2.category,
              'imageUrls' => nil,
              'website' => nil,
              'address' => nil,
              'description' => place_info2.description,
            },
          ]

        result = described_class.execute(query, context: context)
        byebug
        expect(result['data']['placeInfos']).to eq(expected_result)
      end
    end
  end
end