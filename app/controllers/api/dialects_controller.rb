module Api 
  class DialectsController < ApplicationController

    def index
      dialects = Dialect.includes(grammars: :examples).map do |dialect| 
        { 
          id: dialect.id,
          name_en: dialect.name_en, 
          name_jp: dialect.name_jp, 
          start_btn_text: dialect.start_btn_text, 
          next_btn_text: dialect.next_btn_text, 
          grammars: dialect.grammars.map do |grammar|
             {
              id: grammar.id,
              label: grammar.label,
              description: grammar.description,
              position: grammar.position,
              examples: grammar.examples.map do |example|
                url = example.audio_clip.present? ? url_for(example.audio_clip) : nil
                example.attributes.merge!(audio_clip_url: url)
              end
             }
          end
        }
      end
      render json: dialects
    end
  end
end

