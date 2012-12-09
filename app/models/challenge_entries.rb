class ChallengeEntries
  def self.submit(entry_data)
    entries << ChallengeEntry.new(entry_data[:description], entry_data[:language], entry_data[:content])
  end

  def self.current
    entries.map(&:as_hash)
  end

  def self.entries 
    @entries ||= [] 
  end
end

class ChallengeEntry < Struct.new(:description, :language, :content)
  def as_hash
    { description: description, language: language, content: content }
  end
end
