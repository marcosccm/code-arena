require_relative '../../app/models/create_user_session'

describe CreateUserSession do
  context 'with valid user data' do 
    let(:auth_data) { { info: user_data } }
    let(:user_data) { Hash.new }
    let(:user) { stub }
    let(:controller) { stub(:session_created => true) }
    let(:builder) { stub(:find_or_create => true) }

    subject(:session_creator) { CreateUserSession.new(auth_data, controller, builder) }

    it 'find or creates the user associated with the session' do
      builder.should_receive(:find_or_create).with(user_data).and_return(user)
      session_creator.run
    end

    it 'handles the created user back to caller' do
      builder.stub(:find_or_create => user)
      controller.should_receive(:session_created).with(user)
      session_creator.run
    end

  end
end
