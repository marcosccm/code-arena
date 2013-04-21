class ChallengeEntry 
  attr_reader :description, :language, :content, :raw

  def initialize(params) 
    @description = params.fetch(:description)
    @language = params.fetch(:language)
    @raw = params.fetch(:content)
    @content = params.fetch(:content)
  end

  def add_highlight(highlighted_content)
    @content = highlighted_content
  end

  def as_hash
    { description: description, language: language, content: content, raw: raw }
  end
end
