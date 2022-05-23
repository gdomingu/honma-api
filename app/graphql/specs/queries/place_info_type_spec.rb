require 'rails_helper'

describe HonmaApiSchema do
  dialect =  Dialect.create!(name_en: "Yamaguchi", name_jp: "山口弁", area: 5)
  current_user = 
    User.create(email: 'rspectest@test.com', admin: false, password: 'password')
  
  place_info = PlaceInfo.create!(dialect_id: dialect.id, name_jp: "錦帯橋", name_en: "Kintai-yo", category: "Scenery", description: "bluh bluh")
  describe "place_info_type" do

    let(:context) do
      {
        current_user: current_user
      }
    end

    let(:query) do
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
    end
    
    it "returns all place infos associated to that particular dialect and category" do
      expected_result = 
        [
          {
            'id' => place_info.id.to_s,
            'nameEn' => place_info.name_en,
            'nameJp' => place_info.name_jp,
            'category' => place_info.category,
            'imageUrls' => nil,
            'website' => nil,
            'address' => nil,
            'description' => place_info.description,
          }
        ]

      result = described_class.execute(query, context: context)
      expect(result['data']['placeInfos']).to eq(expected_result)
    end
  end
end