class ChallengeEntry 
  include Virtus

  attribute :language, String
  attribute :content, String
  attribute :raw, String
  attribute :author, User
  attribute :challenge_id, String

  def add_highlight(highlighted_content)
    @content = highlighted_content
  end

  def associate_challenge(challenge)
    @challenge_id = challenge.id
  end

  def author_name
    author.nickname if author
  end
end
