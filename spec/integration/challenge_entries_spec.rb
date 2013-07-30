require 'spec_helper'

describe ChallengeEntries do
  subject(:entries) { ChallengeEntries.new }

  describe 'submiting challenge entries' do
    it 'adds the entries to the collection' do
      entry = ChallengeEntry.new
      entries.submit(entry)
      expect(entries.all.count).to eq 1
    end

    it 'persits all entry fields correclty' do
      entry = ChallengeEntry.new(
        :language => 'ruby',
        :raw => '<>',
        :content => 'something',
        :author => { :nickname => 'marcos' }
      )

      entries.submit(entry)
      entry = entries.all.first

      expect(entry.language).to eq 'ruby'
      expect(entry.raw).to eq '<>'
      expect(entry.content).to eq 'something'
      expect(entry.author.nickname).to eq 'marcos'
    end
  end

  it 'retrieves entries by challenge' do
    id = BSON::ObjectId.new
    challenge = double(:id => id)
    
    entry1 = ChallengeEntry.new
    entry2 = ChallengeEntry.new
    entry2.associate_challenge(challenge) 

    entries.submit(entry1)
    entries.submit(entry2)

    associated = entries.for_challenge(challenge)
    expect(associated.count).to eq 1
    expect(associated.first.challenge_id).to eq id
  end
end
