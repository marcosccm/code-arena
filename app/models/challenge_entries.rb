class ChallengeEntries
  def self.submit(new_entries)
    @entries = entries + Array(new_entries)
  end

  def self.current
    entries.map { |entry| { title: entry }}
  end

  def self.entries 
    @entries ||= %w{bla1 bla2 bla3}
  end
end
