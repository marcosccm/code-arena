class ChallengeEntries
  def self.submit(entries)
    @current = entries
  end

  def self.current
    @current || []
  end
end
