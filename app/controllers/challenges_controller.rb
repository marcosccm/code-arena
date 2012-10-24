class ChallengesController < ApplicationController
  def update
    UpdateChallenges.new(params[:content], CurrentChallenge, self).run
  end

  def challenge_updated
    redirect_to root_path, :notice => 'challenge successfully updated'
  end
end
