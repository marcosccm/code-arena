require 'virtus'
require_relative '../../app/models/user'
require_relative '../../app/models/challenge_entry'

describe ChallengeEntry do
  subject(:entry) do 
    ChallengeEntry.new
  end

  describe 'adding highlighted code' do
    let(:highlighted_code)  { 'highlight' }

    it 'changes the content' do
      entry.add_highlight(highlighted_code)
      entry.content.should == highlighted_code
    end
  end

  describe 'authors name' do
    it 'returns the nickname of the author'do
      entry.author = User.new(nickname: 'someone')
      entry.author_name.should == 'someone'
    end
  end
end
