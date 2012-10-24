class CurrentChallenge
  def self.setup(text)
    @text = text
  end

  def self.current
    @text
  end
end
