# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe DialectsController, type: :controller do
  describe 'GET /index' do
    before do
      sign_in(
        User.create(
          email: Faker::Internet.email,
          admin: false,
          password: Faker::Internet.password
        )
      )
      get :index, format: :json
    end

    it 'returns all dialects' do
      expect(response.status).to eq(200)
    end
  end
end
