class Challenge 
  include Virtus
  
  attribute :_id, BSON::ObjectId
  attribute :title, String
  attribute :content, String
  attribute :current, Boolean, :default => false

  alias_method :id, :_id

  def to_hash
    { title: title, content: content, current: current }
  end
end
