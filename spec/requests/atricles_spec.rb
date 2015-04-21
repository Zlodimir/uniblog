require 'rails_helper'

RSpec.describe "Atricles", :type => :request do
  describe "GET /atricles" do
    it "works! (now write some real specs)" do
      get atricles_path
      expect(response).to have_http_status(200)
    end
  end
end
