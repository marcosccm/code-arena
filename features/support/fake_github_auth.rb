class FakeGithubAuth
  def initialize(user_builder=GithubUsers)
    @user_builder = user_builder
    OmniAuth.config.test_mode = true
  end

  def mock_auth(fake_data)
    @user = @user_builder.create(fake_data)
    OmniAuth.config.mock_auth[:github] = { info: fake_data }
  end

  def mock_anonymous_user
    @user = User.anonymous
    OmniAuth.config.mock_auth[:github] = nil
  end

  def current_user
    @user
  end
end
