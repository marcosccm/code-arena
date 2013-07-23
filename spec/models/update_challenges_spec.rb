require_relative '../../app/models/update_challenges'

describe UpdateChallenges do
  let(:challenge) { double(:challenge) }
  let(:ui)        { double(:ui) }
  
  subject(:updater) { UpdateChallenges.new('bla', challenge, ui) }

  context 'with a valid challenge' do
    it 'updates the challenge' do
      expect(challenge).to receive(:update).with('bla')
      expect(ui).to receive(:challenge_updated)
      updater.run
    end
  end
end
