class CurrentChallenge
  def self.setup(text)
    @text = text
  end

  def self.update(text)
    @text = text
  end

  def self.current
    @text || 'default'
  end
end
