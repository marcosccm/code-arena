class CreateUserSession
  def initialize(auth_data, caller, builder=GithubUsers)
    @auth_data = auth_data
    @caller = caller
    @builder = builder
  end

  def run
    user = @builder.find_or_create(@auth_data[:info])
    @caller.session_created(user)
  end
end

