require 'virtus'
require 'bson'
require_relative '../../app/models/github_users'
require_relative '../../app/models/entry_builder'
require_relative '../../app/models/challenge'
require_relative '../../app/models/challenges'

class FakeDataStore
  attr_reader :challenges

  def initialize
    @entry_builder = EntryBuilder.new
    @challenges = Challenges.new
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
    challenge = Challenge.new(name: "Challenge #{index}", body: "Body #{index}")
    Challenge.add(challenge)
  end

  def set_current_entries(entries)
    entries.each { |entry| ChallengeEntries.submit(@entry_builder.build(entry)) }
  end

  def current_entries
    ChallengeEntries.current
  end
end

