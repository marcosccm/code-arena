class HomeController < ApplicationController
  def index
    @challenge = challenges.current
    @entries   = entries.for_challenge(@challenge)
  end

  private

  def entries
    ChallengeEntries.new
  end

  def challenges
    Challenges.new
  end
end
