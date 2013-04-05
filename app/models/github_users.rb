class GithubUsers
  def self.find_or_create(user_data)
    User.new(user_data[:nickname])
  end
end

