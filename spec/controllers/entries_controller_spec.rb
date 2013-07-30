require 'spec_helper'
describe EntriesController do
  describe 'GET /entries' do
    it 'returns the json representation of all challenge entries' do
      entries = double
      expect(ChallengeEntries).to receive(:new).and_return entries
      expect(entries).to receive(:for_challenge)

      get :index
    end
  end
end
