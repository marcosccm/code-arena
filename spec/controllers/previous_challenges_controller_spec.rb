require 'spec_helper'

describe PreviousChallengesController do
  let(:challenges) { double }

  before do
    expect(Challenges).to receive(:new).and_return(challenges)
  end

  describe 'GET /previous_challenges' do
    it 'returns the json representation of previous challenges' do
      previous_challenges = %{a,b,c}
      expect(challenges).to receive(:previous).and_return(previous_challenges)

      get :index
    end
  end
end
