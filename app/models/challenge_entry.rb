class ChallengeEntry 
  attr_reader :description, :language, :content, :raw, :author

  def initialize(params) 
    @description = params.fetch(:description)
    @language = params.fetch(:language)
    @raw = params.fetch(:content)
    @content = params.fetch(:content)
    @author = params.fetch(:author)
  end

  def add_highlight(highlighted_content)
    @content = highlighted_content
  end

  def author_name
    author.nickname if author
  end

  def as_hash
    { description: description, language: language, content: content, raw: raw, author: author_name }
  end
end
