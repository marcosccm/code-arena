class ChallengeEntrySerializer
  def to_hash(entry)
    author_hash = entry.author.to_hash if entry.author
    entry.to_hash.merge(:author => author_hash)
  end
end

class ChallengeEntries
  def self.submit(entry)
    collection.insert(serializer.to_hash(entry))
  end

  def self.current
    entries.map(&:to_hash)
  end

  def self.entries 
    collection.find.map do |raw| 
      ChallengeEntry.new(raw)
    end
  end

  private

  def self.serializer
    ChallengeEntrySerializer.new
  end

  def self.collection
    MongoConnection.collection('challenge_entries')
  end
end

