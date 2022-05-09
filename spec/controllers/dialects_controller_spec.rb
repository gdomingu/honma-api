require 'rails_helper'

RSpec.describe DialectsController, type: :controller do
  describe "GET /index" do
    before do
      sign_in(User.create(email: 'rspectest@test.com', admin: false, password: 'password'))
      get :index, format: :json
    end

    it "returns all dialects" do
      expect(response.status).to eq(200)
    end
  end
end