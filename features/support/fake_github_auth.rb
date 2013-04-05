class FakeGithubAuth
  def mock_auth(fake_data)
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = { info: fake_data }
  end
end
