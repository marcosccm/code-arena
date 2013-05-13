class GithubUsers
  def self.create(user_data)
    collection.insert(user_data)
    User.new(user_data)
  end

  def self.find_by_nickname(nickname)
    data = collection.find(nickname: nickname).first
    User.new(data) if data
  end

  private

  def self.collection
    MongoConnection.collection('github_users')
  end
end

