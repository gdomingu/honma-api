# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do
  describe '#create' do
    let(:grammar) { create(:grammar) }

    before do
      sign_in(
        User.create(
          email: Faker::Internet.email,
          admin: false,
          password: Faker::Internet.password
        )
      )
    end

    context 'with valid params' do
      let(:valid_params) do
        {
          tokyo: 'test tokyo',
          answer: 'test answer',
          grammar_id: grammar.id
        }
      end

      it 'saves quiz properly' do
        expect { post :create, params: { quiz: valid_params } }.to change(Quiz, :count).by(1)
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

      it 'will not save a record' do
        expect { post :create, params: { quiz: invalid_params1 } }.to change(Quiz, :count).by(0)
      end

      it 'will not save a record' do
        expect { post :create, params: { quiz: invalid_params2 } }.to change(Quiz, :count).by(0)
      end

      it 'will not save a record' do
        expect { post :create, params: { quiz: invalid_params3 } }.to change(Quiz, :count).by(0)
      end

      it 'will not save a record' do
        expect { post :create, params: { quiz: invalid_params4 } }.to change(Quiz, :count).by(0)
      end
    end
  end
end
