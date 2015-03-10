require "rails_helper"

RSpec.describe Admin::MessagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/messages").to route_to("admin/messages#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/messages/new").to route_to("admin/messages#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/messages/1").to route_to("admin/messages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/messages/1/edit").to route_to("admin/messages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/messages").to route_to("admin/messages#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/messages/1").to route_to("admin/messages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/messages/1").to route_to("admin/messages#destroy", :id => "1")
    end

  end
end
