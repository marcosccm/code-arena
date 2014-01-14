class User 
  include Virtus

  attribute :nickname, String

  def self.anonymous
    new(nickname: 'anonymous')
  end
end

