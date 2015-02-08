require 'test_helper'

class Admin::AlbumsControllerTest < ActionController::TestCase
  setup do
    @admin_album = admin_albums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_album" do
    assert_difference('Admin::Album.count') do
      post :create, admin_album: { description: @admin_album.description, name: @admin_album.name, tags: @admin_album.tags }
    end

    assert_redirected_to admin_album_path(assigns(:admin_album))
  end

  test "should show admin_album" do
    get :show, id: @admin_album
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_album
    assert_response :success
  end

  test "should update admin_album" do
    patch :update, id: @admin_album, admin_album: { description: @admin_album.description, name: @admin_album.name, tags: @admin_album.tags }
    assert_redirected_to admin_album_path(assigns(:admin_album))
  end

  test "should destroy admin_album" do
    assert_difference('Admin::Album.count', -1) do
      delete :destroy, id: @admin_album
    end

    assert_redirected_to admin_albums_path
  end
end
