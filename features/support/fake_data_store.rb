require_relative '../../app/models/current_challenge'
class FakeDataStore
  def set_current_challenge
    CurrentChallenge.setup('maior tenso')
  end

  def current_challenge
    CurrentChallenge.current
  end
end

