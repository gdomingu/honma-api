module Api 
  class DialectsController < ApplicationController
    def index
      dialects = Dialect.order(:name_en).includes(grammars: [:examples, :quizzes]).map do |dialect| 
        { 
          id: dialect.id,
          name_en: dialect.name_en, 
          name_jp: dialect.name_jp, 
          start_btn_text: dialect.start_btn_text, 
          next_btn_text: dialect.next_btn_text, 
          complete_btn_text: dialect.complete_btn_text, 
          grammars: dialect.grammars.order(:position).map do |grammar|
             {
              id: grammar.id,
              label: grammar.label,
              description: grammar.description,
              position: grammar.position,
              commonness: grammar.commonness,
              examples: grammar.examples.map {|example|
                url = example.audio_clip.present? ? url_for(example.audio_clip) : nil
                example.attributes.merge!(audio_clip_url: url)
              },
              quizzes: grammar.quizzes.map {|quiz|
                {
                  id: quiz.id, 
                  tokyo: quiz.tokyo,  
                  answer: quiz.answer,
                  quiz_completed: QuizCompletion.find_by(user: current_user, quiz: quiz)
                }
              }
            }
          end
        }
      end
      render json: dialects
    end
  end
end

