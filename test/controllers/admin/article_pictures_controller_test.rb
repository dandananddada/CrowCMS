require 'test_helper'

class Admin::ArticlePicturesControllerTest < ActionController::TestCase
  setup do
    @admin_article_picture = admin_article_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_article_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_article_picture" do
    assert_difference('Admin::ArticlePicture.count') do
      post :create, admin_article_picture: { article_id: @admin_article_picture.article_id }
    end

    assert_redirected_to admin_article_picture_path(assigns(:admin_article_picture))
  end

  test "should show admin_article_picture" do
    get :show, id: @admin_article_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_article_picture
    assert_response :success
  end

  test "should update admin_article_picture" do
    patch :update, id: @admin_article_picture, admin_article_picture: { article_id: @admin_article_picture.article_id }
    assert_redirected_to admin_article_picture_path(assigns(:admin_article_picture))
  end

  test "should destroy admin_article_picture" do
    assert_difference('Admin::ArticlePicture.count', -1) do
      delete :destroy, id: @admin_article_picture
    end

    assert_redirected_to admin_article_pictures_path
  end
end
