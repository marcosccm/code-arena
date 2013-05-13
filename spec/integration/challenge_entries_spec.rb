require 'spec_helper'

describe ChallengeEntries do
  it 'can persist challenge entries' do
    entry = ChallengeEntry.new
    ChallengeEntries.submit(entry)
    ChallengeEntries.entries.count.should == 1
  end

  it 'persits all entry fields correclty' do
    entry = ChallengeEntry.new(
      :description => 'something',
      :language => 'ruby',
      :raw => '<>',
      :content => 'something',
      :author => { :nickname => 'marcos' }
    )

    ChallengeEntries.submit(entry)
    entry = ChallengeEntries.entries.first

    entry.description.should == 'something'
    entry.language.should == 'ruby'
    entry.raw.should == '<>'
    entry.content.should == 'something'
    entry.author.nickname.should == 'marcos'
  end
end
