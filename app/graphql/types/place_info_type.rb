# frozen_string_literal: true
module Types
  class PlaceInfoType < Types::BaseObject
    field :id, ID, null: false
    field :name_jp, String
    field :name_en, String
    field :img_url, String
    field :latitude, Float
    field :longtitude, Float
    field :dialect, DialectType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :category, String
    field :description, String
    field :website, String
  end
end
