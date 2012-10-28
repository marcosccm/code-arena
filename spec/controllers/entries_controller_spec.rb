require 'spec_helper'
describe EntriesController do
  describe 'GET /entries' do
    it 'returns the json representation of all challenge entries' do
      entries = %{a,b,c}
      ChallengeEntries.should_receive(:current).and_return(entries)

      get :index
    end
  end
end
