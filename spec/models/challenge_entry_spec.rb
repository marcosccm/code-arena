require_relative '../../app/models/challenge_entry'

describe ChallengeEntry do
  let(:author) { stub(nickname: 'someone') }
  subject(:entry) do 
    ChallengeEntry.new(description: 'descr', language: 'ruby', content: 'code', author: author)
  end

  describe 'adding highlighted code' do
    let(:highlighted_code)  { 'highlight' }

    it 'changes the content' do
      entry.add_highlight(highlighted_code)
      entry.content.should == highlighted_code
    end

    it 'keeps the raw content' do
      entry.add_highlight(highlighted_code)
      entry.raw.should == 'code'
    end
  end

  describe 'authors name' do
    it 'returns the nickname of the author'do
      entry.author_name.should == 'someone'
    end
  end

  describe 'hash representation' do
    it 'contains description, language, content and raw content' do
      expected_hash = {
        description: 'descr',
        language:    'ruby',
        content:     'code',
        raw:         'code',
        author:      'someone'
      }
      entry.as_hash.should == expected_hash
    end
  end
end
