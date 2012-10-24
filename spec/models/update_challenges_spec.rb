require_relative '../../app/models/update_challenges'

describe UpdateChallenges do
  let(:challenge) { stub(:challenge) }
  let(:ui)        { stub(:ui) }
  
  subject(:updater) { UpdateChallenges.new('bla', challenge, ui) }

  context 'with a valid challenge' do
    it 'updates the challenge' do
      challenge.should_receive(:update).with('bla')
      ui.should_receive(:challenge_updated)
      updater.run
    end
  end
end
