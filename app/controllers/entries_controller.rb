class EntriesController < ApplicationController
  def create
    SubmitEntries.new(params[:entries], ChallengeEntries, self).run
  end

  def entry_submited
    redirect_to root_path, :notice => 'entry submited successfully'
  end
end
