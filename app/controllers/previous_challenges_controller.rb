class PreviousChallengesController < ApplicationController
  respond_to :json

  def index
    render json: challenges.previous
  end

  private

  def challenges
    Challenges.new
  end
end
