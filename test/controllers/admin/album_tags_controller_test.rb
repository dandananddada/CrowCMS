require 'test_helper'

class Admin::AlbumTagsControllerTest < ActionController::TestCase
  setup do
    @admin_album_tag = admin_album_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_album_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_album_tag" do
    assert_difference('Admin::AlbumTag.count') do
      post :create, admin_album_tag: { text: @admin_album_tag.text }
    end

    assert_redirected_to admin_album_tag_path(assigns(:admin_album_tag))
  end

  test "should show admin_album_tag" do
    get :show, id: @admin_album_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_album_tag
    assert_response :success
  end

  test "should update admin_album_tag" do
    patch :update, id: @admin_album_tag, admin_album_tag: { text: @admin_album_tag.text }
    assert_redirected_to admin_album_tag_path(assigns(:admin_album_tag))
  end

  test "should destroy admin_album_tag" do
    assert_difference('Admin::AlbumTag.count', -1) do
      delete :destroy, id: @admin_album_tag
    end

    assert_redirected_to admin_album_tags_path
  end
end
