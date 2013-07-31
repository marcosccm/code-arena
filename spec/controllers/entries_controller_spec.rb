require 'spec_helper'
describe EntriesController do
  let(:entries)    { double }
  let(:challenges) { double }
  let(:current_challenge) { double }
  let(:current_entries) { "entries" }

  before do
    Challenges.stub(:new) { challenges }
    ChallengeEntries.stub(:new) { entries }
  end

  describe 'GET /entries' do
    it 'returns the json representation of all challenge entries' do
      expect(challenges).to receive(:current) {  current_challenge }
      expect(entries).to receive(:for_challenge).with(current_challenge) { current_entries }

      get :index

      expect(response.body).to eq current_entries
    end
  end
end
