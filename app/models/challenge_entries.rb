class ChallengeEntries
  def self.submit(entry)
    entries << entry
  end

  def self.current
    entries.map(&:as_hash)
  end

  def self.entries 
    @entries ||= [] 
  end
end

