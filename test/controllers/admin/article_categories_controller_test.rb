require 'test_helper'

class Admin::ArticleCategoriesControllerTest < ActionController::TestCase
  setup do
    @admin_article_category = admin_article_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_article_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_article_category" do
    assert_difference('Admin::ArticleCategory.count') do
      post :create, admin_article_category: { ancestry: @admin_article_category.ancestry, is_abstract: @admin_article_category.is_abstract, is_article: @admin_article_category.is_article, is_carousel: @admin_article_category.is_carousel, is_file: @admin_article_category.is_file, is_thumb: @admin_article_category.is_thumb, title: @admin_article_category.title }
    end

    assert_redirected_to admin_article_category_path(assigns(:admin_article_category))
  end

  test "should show admin_article_category" do
    get :show, id: @admin_article_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_article_category
    assert_response :success
  end

  test "should update admin_article_category" do
    patch :update, id: @admin_article_category, admin_article_category: { ancestry: @admin_article_category.ancestry, is_abstract: @admin_article_category.is_abstract, is_article: @admin_article_category.is_article, is_carousel: @admin_article_category.is_carousel, is_file: @admin_article_category.is_file, is_thumb: @admin_article_category.is_thumb, title: @admin_article_category.title }
    assert_redirected_to admin_article_category_path(assigns(:admin_article_category))
  end

  test "should destroy admin_article_category" do
    assert_difference('Admin::ArticleCategory.count', -1) do
      delete :destroy, id: @admin_article_category
    end

    assert_redirected_to admin_article_categories_path
  end
end
