class ChallengeEntries
  
  def self.submit(new_entries)
    entries + Array(new_entries)
  end

  def self.current
    entries
  end

  def self.entries 
    @entries ||= []
  end
end
