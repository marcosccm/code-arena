Given /^a current challenge$/ do
  @data_store.set_current_challenge
end

When /^I go to the home page$/ do
  @app.visit_home_page
end

When /^I edit the current challenge$/ do
  @app.edit_challenge_content('mais maneiro')
end

Then /^I should see the challenge$/ do
  @app.shows_challenge(@data_store.current_challenge)
end

Then /^I should see the edited challenge$/ do
  @app.shows_challenge_changed(@data_store.current_challenge)
end
