class FakeGithubAuth
  def mock_auth(fake_data)
    @user = fake_data
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = { info: fake_data }
  end

  def current_user
    @user[:nickname]
  end
end
