class ChallengeEntrySerializer
  def to_hash(entry)
    author_hash = entry.author.to_hash if entry.author
    entry.to_hash.merge(:author => author_hash)
  end
end

class ChallengeEntries
  def initialize
    @collection = MongoConnection.collection('challenge_entries')
    @serializer = ChallengeEntrySerializer.new
  end

  def submit(entry)
    collection.insert(serializer.to_hash(entry))
  end

  def for_challenge(challenge)
    map_to_entries collection.find(challenge_id: challenge.id)
  end

  def all 
    map_to_entries collection.find
  end

  private

  attr_reader :serializer, :collection

  def map_to_entries(results)
    results.map { |raw| ChallengeEntry.new(raw) }
  end
end
