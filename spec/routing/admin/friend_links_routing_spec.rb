require "rails_helper"

RSpec.describe Admin::FriendLinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/friend_links").to route_to("admin/friend_links#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/friend_links/new").to route_to("admin/friend_links#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/friend_links/1").to route_to("admin/friend_links#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/friend_links/1/edit").to route_to("admin/friend_links#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/friend_links").to route_to("admin/friend_links#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/friend_links/1").to route_to("admin/friend_links#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/friend_links/1").to route_to("admin/friend_links#destroy", :id => "1")
    end

  end
end
