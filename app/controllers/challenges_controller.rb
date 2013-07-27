class ChallengesController < ApplicationController
  respond_to :json

  def show
    render json: challenges.current
  end

  def update
    UpdateChallenges.new(params[:challenge], challenges, self).run
  end

  def challenge_updated
    render :json => { 'message' => 'challenge successfully updated' }
  end

  private

  def challenges
    Challenges.new
  end
end
