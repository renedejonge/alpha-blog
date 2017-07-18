require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Pietje", email: "pietje@example.com", password: "password")
  end

  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "De titel van het artikel", description: "De inhoud van het artikel" } }
    end
    follow_redirect!
    assert_template 'articles/show'
    assert_match "De titel van het artikel", response.body
    assert_match "De inhoud van het artikel", response.body
  end

end