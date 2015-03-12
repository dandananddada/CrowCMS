require 'rails_helper'

RSpec.describe "AlbumTagTests", type: :request do
  describe "GET /album_tag_tests" do
    it "works! (now write some real specs)" do
      get album_tag_tests_path
      expect(response).to have_http_status(200)
    end
  end
end
