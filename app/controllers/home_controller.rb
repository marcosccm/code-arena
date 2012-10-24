class HomeController < ApplicationController
  def index
    @challenge = CurrentChallenge.current
    @entries   = ChallengeEntries.current
  end
end
