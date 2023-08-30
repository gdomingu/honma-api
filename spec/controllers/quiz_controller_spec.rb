# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  describe '#create' do
    let(:grammar) { create(:grammar) }

    context 'with valid params' do
      let(:valid_params) do
        {
          tokyo: 'test tokyo',
          answer: 'test answer',
          grammar_id: grammar.id
        }
      end

      it 'saves quiz properly' do
        expect { Quiz.create!(valid_params) }.to change(Quiz, :count).by(1)
      end
    end

    context 'with invalid params' do
      let(:invalid_params1) do
        {
          tokyo: nil,
          answer: 'test answer',
          grammar_id: grammar.id
        }
      end
      let(:invalid_params2) do
        {
          tokyo: 'test tokyo',
          answer: nil,
          grammar_id: grammar.id
        }
      end
      let(:invalid_params3) do
        {
          tokyo: 'test tokyo',
          answer: 'test answer',
          grammar_id: nil
        }
      end
      let(:invalid_params4) do
        {
          tokyo: nil,
          answer: nil,
          grammar_id: nil
        }
      end

      it 'raises ActiveRecord::RecordInvalid error' do
        expect { Quiz.create!(invalid_params1) }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'raises ActiveRecord::RecordInvalid error' do
        expect { Quiz.create!(invalid_params2) }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'raises ActiveRecord::RecordInvalid error' do
        expect { Quiz.create!(invalid_params3) }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'raises ActiveRecord::RecordInvalid error' do
        expect { Quiz.create!(invalid_params4) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
