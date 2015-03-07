require 'rails_helper'

RSpec.describe "Admin::ProductOptions", type: :request do
  describe "GET /admin_product_options" do
    it "works! (now write some real specs)" do
      get admin_product_options_path
      expect(response).to have_http_status(200)
    end
  end
end
