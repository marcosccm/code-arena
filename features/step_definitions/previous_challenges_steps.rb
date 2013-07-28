Given(/^many challenges$/) do
  5.times do |index|
    @data_store.create_challenge(index)
  end
end

When(/^navigate to previous challenges$/) do
  @app.visit_previous_challenges
end

Then(/^I should see all previous challenges$/) do
  @app.shows_challenge(*@data_store.previous_challenges)
end
