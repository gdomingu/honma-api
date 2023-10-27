# frozen_string_literal: true

module Api
  class GrammarsController < ApplicationController
    def index
      grammars_with_examples =
        Grammar.order(:position)
               .joins(:examples)
               .includes([[examples: :audio_clip_attachment], :quizzes])
               .distinct

      grammars =
        grammars_with_examples.map do |grammar|
          {
            id: grammar.id,
            dialect_id: grammar.dialect_id,
            label: grammar.label,
            description: grammar.description,
            position: grammar.position,
            commonness: grammar.commonness,
            examples: grammar.examples.map do |example|
                        url = example.audio_clip.present? ? url_for(example.audio_clip) : nil
                        example.attributes.merge!(audio_clip_url: url)
                      end,
            quizzes: grammar.quizzes.map do |quiz|
                       {
                         id: quiz.id,
                         tokyo: quiz.tokyo,
                         answer: quiz.answer,
                         quiz_completed: QuizCompletion.find_by(user: current_user, quiz: quiz)&.created_at
                       }
                     end
          }
        end

      render json: grammars
    end
  end
end
