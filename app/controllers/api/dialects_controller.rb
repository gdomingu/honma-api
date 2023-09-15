# frozen_string_literal: true

module Api
  class DialectsController < ApplicationController
    def index
      dialects =
        Dialect.order(:name_en).includes([default_image_attachment: :blob]).map do |dialect|
          {
            id: dialect.id,
            name_en: dialect.name_en,
            name_jp: dialect.name_jp,
            start_btn_text: dialect.start_btn_text,
            next_btn_text: dialect.next_btn_text,
            complete_btn_text: dialect.complete_btn_text,
            description: dialect.description,
            area: Dialect.areas.key(dialect.area),
            default_image: dialect.default_image.present? ? url_for(dialect.default_image) : nil
          }
        end

      render json: dialects
    end
  end
end
