class EntriesController < ApplicationController
  respond_to :json
  def index
    entries = ChallengeEntries.current
    render :json => entries
  end

  def create
    SubmitEntries.new(params[:entries], ChallengeEntries, self).run
  end

  def entry_submited
    redirect_to root_path, :notice => 'entry submited successfully'
  end
end
