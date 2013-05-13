class ChallengeEntry 
  include Virtus

  attribute :description, String
  attribute :language, String
  attribute :content, String
  attribute :raw, String
  attribute :author, User

  def add_highlight(highlighted_content)
    @content = highlighted_content
  end

  def author_name
    author.nickname if author
  end
end
