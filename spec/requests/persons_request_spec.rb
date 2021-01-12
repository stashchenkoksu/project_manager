require 'rails_helper'

RSpec.describe "Persons", type: :request do

  describe "GET /profile" do
    it "returns http success" do
      get "/persons/profile"
      expect(response).to have_http_status(:success)
    end
  end

end
