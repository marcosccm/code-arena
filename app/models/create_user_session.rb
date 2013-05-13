class CreateUserSession
  def initialize(auth_data, caller, builder=GithubUsers)
    @auth_data = auth_data
    @caller = caller
    @builder = builder
  end

  def run
    user_data = @auth_data[:info]
    user = @builder.find_by_nickname(user_data[:nickname]) || @builder.create(user_data)
    @caller.session_created(user)
  end
end

