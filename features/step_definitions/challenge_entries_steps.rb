Given /^many entries for that challenge$/ do
  entries = %w{entry1 entry2 entry3}
  @data_store.set_current_entries(entries)
end

Then /^I should see the current entries$/ do
  @app.shows_challenge_entries(@data_store.current_entries)
end
