class EntriesController < ApplicationController
  respond_to :json

  def index
    render :json => current_entries
  end

  def create
    SubmitEntries.new(ChallengeEntries.new, self).submit(params[:entry], current_user, current_challenge)
  end

  def entry_submited
    render :json => { 'message' => 'entry submited successfully' }
  end

  private

  def current_entries
    ChallengeEntries.new.for_challenge(current_challenge)
  end

  def current_challenge
    Challenges.new.current
  end
end
