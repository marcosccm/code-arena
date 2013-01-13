require_relative '../../app/models/challenge_entry'

describe ChallengeEntry do
  subject(:entry) do 
    ChallengeEntry.new(description: 'descr', language: 'ruby', content: 'code') 
  end

  describe 'adding highlighted code' do
    let(:highlighted_code)  { 'highlight' }

    it 'changes the content' do
      entry.add_highlight(highlighted_code)
      entry.content.should == highlighted_code
    end
  end

  describe 'hash representation' do
    it 'contains description, language and content' do
      expected_hash = {
        description: 'descr',
        language:    'ruby',
        content:     'code'
      }
      entry.as_hash.should == expected_hash
    end
  end
end
