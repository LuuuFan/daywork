require 'rails_helper'

RSpec.describe "Cheers", type: :request do
  describe "GET /cheers" do
    it "works! (now write some real specs)" do
      get cheers_path
      expect(response).to have_http_status(200)
    end
  end
end
