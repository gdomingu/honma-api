require 'rails_helper'

RSpec.describe Api::DialectsController, type: :controller do
  describe '#index' do
    before do
      sign_in(
        User.create(
          email: Faker::Internet.email,
          admin: false,
          password: Faker::Internet.password
        )
      )
    end

    it 'returns 200' do
      get :index
      expect(response).to be_successful
    end
  end
end
