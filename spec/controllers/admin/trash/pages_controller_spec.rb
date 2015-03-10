require 'rails_helper'

RSpec.describe Admin::Trash::PagesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #restore" do
    it "returns http success" do
      get :restore
      expect(response).to have_http_status(:success)
    end
  end

end
