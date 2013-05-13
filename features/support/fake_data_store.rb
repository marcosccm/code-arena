require_relative '../../app/models/github_users'
require_relative '../../app/models/entry_builder'
require_relative '../../app/models/challenge_entries'

class FakeDataStore
  def initialize
    @entry_builder = EntryBuilder.new
  end

  def set_current_challenge
    CurrentChallenge.setup('maior tenso', 'muita tensao com essa turminha')
  end

  def current_challenge
    CurrentChallenge.current
  end

  def set_current_entries(entries)
    entries.each { |entry| ChallengeEntries.submit(@entry_builder.build(entry)) }
  end

  def current_entries
    ChallengeEntries.current
  end
end

