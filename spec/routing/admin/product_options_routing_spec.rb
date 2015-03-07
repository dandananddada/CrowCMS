require "rails_helper"

RSpec.describe Admin::ProductOptionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/product_options").to route_to("admin/product_options#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/product_options/new").to route_to("admin/product_options#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/product_options/1").to route_to("admin/product_options#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/product_options/1/edit").to route_to("admin/product_options#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/product_options").to route_to("admin/product_options#create")
    end

    it "routes to #update" do
      expect(:put => "/admin/product_options/1").to route_to("admin/product_options#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/product_options/1").to route_to("admin/product_options#destroy", :id => "1")
    end

  end
end
