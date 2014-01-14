Given /^I am a logged user$/ do
  @auth.mock_auth(nickname: 'testuser')
  @app.visit_home_page
  @app.login_with_github
end

Given /^I am not a logged user$/ do
  @auth.mock_anonymous_user
end

When /^I log in with my github account$/ do
  @auth.mock_auth(nickname: 'testuser')
  @app.visit_home_page
  @app.login_with_github
end

When /^I logout of my account$/ do
  @app.logout
end

Then /^I should not see my user details on the page$/ do
  @app.do_not_show_user_details(@auth.current_user)
end

Then /^I should see my user details on the page$/ do
  @app.shows_user_details(@auth.current_user)
end
