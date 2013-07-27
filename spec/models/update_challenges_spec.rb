require_relative '../../app/models/update_challenges'

describe UpdateChallenges do
  let(:challenge)  { double(:challenge) }
  let(:challenges) { double(:challenges) }
  let(:ui)         { double(:ui) }
  let(:data)       { { 'id' => "challenge-id" } }
  
  subject(:updater) { UpdateChallenges.new(data, challenges, ui) }

  context 'with a valid challenge' do
    it 'updates the challenge' do
      expect(challenges).to receive(:current).and_return challenge
      expect(challenges).to receive(:update).with(challenge)
      expect(ui).to receive(:challenge_updated)
      updater.run
    end
  end
end
