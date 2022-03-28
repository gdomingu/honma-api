# frozen_string_literal: true
include(Rails.application.routes.url_helpers)
module Types
  class PlaceInfoType < Types::BaseObject
    field :id, ID, null: false
    field :name_jp, String
    field :name_en, String
    field :image_urls, [String], null: true
    field :latitude, Float
    field :longtitude, Float
    field :dialect, DialectType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :category, String
    field :description, String
    field :website, String
    field :address, String

    def image_urls
      if object.images.present?
        object.images.map do |image|
          polymorphic_url(image)
        end
      end
    end

    def address
      if object.latitude.present? && object.longtitude.present?
        Geocoder.search([object.latitude, object.longtitude]).first.address
      end
    end
  end
end
