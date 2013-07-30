Given /^many entries for that challenge$/ do
  author = @auth.current_user
  entries = [
    { description: 'entry1', language: 'Ruby', content: 'bla1', author: author },
    { description: 'entry2', language: 'Python', content: 'bla2', author: author },
    { description: 'entry3', language: 'Java', content: 'bla3', author: author }
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

  my_entry = @data_store.current_entries.last
  @app.shows_challenge_entries([my_entry.to_hash.merge(author: @auth.current_user)])
end
