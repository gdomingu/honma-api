# frozen_string_literal: true

module Types
  class DialectType < Types::BaseObject
    field :id, ID, null: false
    field :name_en, String
    field :name_jp, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :start_btn_text, String
    field :next_btn_text, String
    field :complete_btn_text, String
    field :description, String, null: false
    field :area, Integer
    field :place_infos, [PlaceInfoType]
  end
end
