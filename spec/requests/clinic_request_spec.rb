require 'rails_helper'

RSpec.describe "Clinics", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/clinic/index"
      expect(response).to have_http_status(:success)
    end
  end

end
