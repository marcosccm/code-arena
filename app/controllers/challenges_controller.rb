class ChallengesController < ApplicationController
  respond_to :json

  def show
    challenge = CurrentChallenge.current
    render json: challenge
  end

  def update
    UpdateChallenges.new(params[:content], CurrentChallenge, self).run
  end

  def challenge_updated
    render :json => { 'message' => 'challenge successfully updated' }
  end
end
