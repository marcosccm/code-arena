Given /^many entries for that challenge$/ do
  entries = %w{entry1 entry2 entry3}
  @data_store.set_current_entries(entries)
end

Then /^I should see the current entries$/ do
  @app.shows_challenge_entries(@data_store.current_entries)
end

When /^I post a challenge entry$/ do
  @app.submit_challenge_entry('entry 4')
end

Then /^I should see my challenge entry$/ do
  @app.shows_success_message('entry submited successfully')
  @app.shows_challenge_entries(@data_store.current_entries)
end
