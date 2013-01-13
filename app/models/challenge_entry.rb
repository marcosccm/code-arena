class ChallengeEntry 
  attr_accessor :description, :language, :content

  def initialize(params) 
    @description = params.fetch(:description)
    @language = params.fetch(:language)
    @content = params.fetch(:content)
  end

  def add_highlight(highlighted_content)
    @content = highlighted_content
  end

  def as_hash
    { description: description, language: language, content: content }
  end
end
