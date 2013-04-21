Given /^many entries for that challenge$/ do
  entries = [
    { description: 'entry1', language: 'Ruby', content: 'bla1' },
    { description: 'entry2', language: 'Python', content: 'bla2' },
    { description: 'entry3', language: 'Java', content: 'bla3' }
  ] 

  @data_store.set_current_entries(entries)
end

Then /^I should see the current entries$/ do
  @app.shows_challenge_entries(@data_store.current_entries)
end

When /^I post a challenge entry$/ do
  @app.submit_challenge_entry(
    description: 'entry 4',
    language:    'Ruby',
    content:     'content'
  )
end

Then /^I should see my challenge entry$/ do
  @app.shows_success_message('entry submited successfully')
  @app.shows_challenge_entries(@data_store.current_entries)
end
