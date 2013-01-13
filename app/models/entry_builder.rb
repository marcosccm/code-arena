class EntryBuilder
  def initialize(factory=ChallengeEntry, highlighter=SyntaxHighlighter.new)
    @factory = factory
    @highlighter = highlighter
  end

  def build(params)
    entry = @factory.new(params)
    @highlighter.highlight(entry)
    entry
  end
end
