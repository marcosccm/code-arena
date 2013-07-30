require 'virtus'
require 'bson'
require_relative '../../app/models/github_users'
require_relative '../../app/models/entry_builder'
require_relative '../../app/models/challenge'
require_relative '../../app/models/challenges'

class FakeDataStore
  attr_reader :challenges, :entries

  def initialize
    @entry_builder = EntryBuilder.new
    @challenges = Challenges.new
    @entries = ChallengeEntries.new
  end

  def set_current_challenge
    challenge = Challenge.new(name: "maior tenso", body: "muita tensao com essa turminha", current: true)
    challenges.add(challenge)
  end

  def current_challenge
    challenges.current
  end

  def previous_challenges
    challenges.previous
  end

  def create_challenge(index)
    challenge = Challenge.new(title: "Challenge #{index}", content: "Body #{index}")
    challenges.add(challenge)
  end

  def set_current_entries(entries_hash)
    entries_hash.each do |entry_hash| 
      entry = @entry_builder.build(entry_hash)
      entry.associate_challenge(current_challenge)
      entries.submit(entry) 
    end
  end

  def current_entries
    entries.for_challenge(current_challenge)
  end
end

