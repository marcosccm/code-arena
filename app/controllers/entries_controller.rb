class EntriesController < ApplicationController
  respond_to :json

  def index
    entries = ChallengeEntries.current
    render :json => entries
  end

  def create
    SubmitEntries.new(ChallengeEntries, self).submit(params[:entry], current_user)
  end

  def entry_submited
    render :json => { 'message' => 'entry submited successfully' }
  end
end
