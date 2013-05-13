class FakeGithubAuth
  def initialize(user_builder=GithubUsers)
    @user_builder = user_builder
  end

  def mock_auth(fake_data)
    @user = @user_builder.create(fake_data)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = { info: fake_data }
  end

  def current_user
    @user
  end
end
