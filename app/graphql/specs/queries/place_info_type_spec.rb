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

    let(:dialect_hiroshima) { create(:dialect, :hiroshima) }
    let(:dialect_ehime) { create(:dialect, :ehime) }
        
    context "query by dialect id" do  
      let(:query) {
        <<-GRAPHQL
        query {
          placeInfos(dialectId: #{dialect_hiroshima.id}) {
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
      
      it "returns all place infos associated to a particular dialect" do   
        place_info1 = PlaceInfo.find_or_create_by!(dialect_id: dialect_hiroshima.id, name_jp: "縮景園", name_en: "Shukkeien", category: "Scenery", description: Faker::Lorem.paragraph)
        place_info2 = PlaceInfo.find_or_create_by!(dialect_id: dialect_hiroshima.id, name_jp: "千光寺", name_en: "Senko-ji", category: "Scenery", description: Faker::Lorem.paragraph)
        place_info3 = PlaceInfo.find_or_create_by!(dialect_id: dialect_hiroshima.id, name_jp: "みっちゃん", name_en: "Mitchan", category: "Restaurants", description: Faker::Lorem.paragraph)
        place_info4 = PlaceInfo.find_or_create_by!(dialect_id: dialect_ehime.id, name_jp: "道後温泉", name_en: "Dogo-onsen", category: "Scenery", description: Faker::Lorem.paragraph)
        
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
            {
              'id' => place_info3.id.to_s,
              'nameEn' => place_info3.name_en,
              'nameJp' => place_info3.name_jp,
              'category' => place_info3.category,
              'imageUrls' => nil,
              'website' => nil,
              'address' => nil,
              'description' => place_info3.description,
            },
          ]

        result = described_class.execute(query, context: context)
        expect(result['data']['placeInfos']).to eq(expected_result)
      end
    end

    context "query by dialect id and category" do
      category = "Restaurants"
      let(:query) {
        <<-GRAPHQL
        query {
          placeInfos(dialectId: #{dialect_hiroshima.id}, category: "#{category}") {
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

      it "returns all place infos associated to a particular dialect and category" do
        place_info1 = PlaceInfo.find_or_create_by!(dialect_id: dialect_hiroshima.id, name_jp: "縮景園", name_en: "Shukkeien", category: "Scenery", description: Faker::Lorem.paragraph)
        place_info2 = PlaceInfo.find_or_create_by!(dialect_id: dialect_hiroshima.id, name_jp: "千光寺", name_en: "Senko-ji", category: "Scenery", description: Faker::Lorem.paragraph)
        place_info3 = PlaceInfo.find_or_create_by!(dialect_id: dialect_hiroshima.id, name_jp: "みっちゃん", name_en: "Mitchan", category: "Restaurants", description: Faker::Lorem.paragraph)
        place_info4 = PlaceInfo.find_or_create_by!(dialect_id: dialect_ehime.id, name_jp: "道後温泉", name_en: "Dogo-onsen", category: "Scenery", description: Faker::Lorem.paragraph)
          
        expected_result = 
            [
              {
                'id' => place_info3.id.to_s,
                'nameEn' => place_info3.name_en,
                'nameJp' => place_info3.name_jp,
                'category' => place_info3.category,
                'imageUrls' => nil,
                'website' => nil,
                'address' => nil,
                'description' => place_info3.description,
              },
            ]
  
        result = described_class.execute(query, context: context)
        expect(result['data']['placeInfos']).to eq(expected_result)
      end
    end
  end
end