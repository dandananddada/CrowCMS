require 'test_helper'

class Admin::ArticlesControllerTest < ActionController::TestCase
  setup do
    @admin_article = admin_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_article" do
    assert_difference('Admin::Article.count') do
      post :create, admin_article: { abstract: @admin_article.abstract, article_category_id: @admin_article.article_category_id, author: @admin_article.author, content: @admin_article.content, file_url: @admin_article.file_url, hits: @admin_article.hits, is_carousel: @admin_article.is_carousel, is_mark: @admin_article.is_mark, is_recommand: @admin_article.is_recommand, thumb_url: @admin_article.thumb_url, title: @admin_article.title }
    end

    assert_redirected_to admin_article_path(assigns(:admin_article))
  end

  test "should show admin_article" do
    get :show, id: @admin_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_article
    assert_response :success
  end

  test "should update admin_article" do
    patch :update, id: @admin_article, admin_article: { abstract: @admin_article.abstract, article_category_id: @admin_article.article_category_id, author: @admin_article.author, content: @admin_article.content, file_url: @admin_article.file_url, hits: @admin_article.hits, is_carousel: @admin_article.is_carousel, is_mark: @admin_article.is_mark, is_recommand: @admin_article.is_recommand, thumb_url: @admin_article.thumb_url, title: @admin_article.title }
    assert_redirected_to admin_article_path(assigns(:admin_article))
  end

  test "should destroy admin_article" do
    assert_difference('Admin::Article.count', -1) do
      delete :destroy, id: @admin_article
    end

    assert_redirected_to admin_articles_path
  end
end
