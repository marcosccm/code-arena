require 'spec_helper'

describe ChallengeEntries do
  it 'can persist challenge entries' do
    entry = ChallengeEntry.new
    ChallengeEntries.submit(entry)
    expect(ChallengeEntries.entries.count).to eq 1
  end

  it 'persits all entry fields correclty' do
    entry = ChallengeEntry.new(
      :language => 'ruby',
      :raw => '<>',
      :content => 'something',
      :author => { :nickname => 'marcos' }
    )

    ChallengeEntries.submit(entry)
    entry = ChallengeEntries.entries.first

    expect(entry.language).to eq 'ruby'
    expect(entry.raw).to eq '<>'
    expect(entry.content).to eq 'something'
    expect(entry.author.nickname).to eq 'marcos'
  end
end
