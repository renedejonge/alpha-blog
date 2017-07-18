require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

  def setup
  end

  test "successfull signup of user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { username: "Pietje", email: "pietje@example.com", password: "password"} }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_match "Pietje", response.body
  end

end
