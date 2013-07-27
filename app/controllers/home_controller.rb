class HomeController < ApplicationController
  def index
    @challenge = challenges.current
    @entries   = ChallengeEntries.current
  end

  private

  def challenges
    Challenges.new
  end
end
