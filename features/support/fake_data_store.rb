require_relative '../../app/models/current_challenge'
require_relative '../../app/models/challenge_entries'

class FakeDataStore
  def set_current_challenge
    CurrentChallenge.setup('maior tenso')
  end

  def current_challenge
    CurrentChallenge.current
  end

  def set_current_entries(entries)
    ChallengeEntries.submit(entries)
  end

  def current_entries
    ChallengeEntries.current
  end
end

