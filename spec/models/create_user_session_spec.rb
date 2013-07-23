require_relative '../../app/models/create_user_session'

describe CreateUserSession do
  context 'with valid user data' do 
    let(:auth_data) { { info: user_data } }
    let(:user_data) { { nickname: 'marcosccm' } }
    let(:user) { double }
    let(:controller) { double(:session_created => true) }
    let(:builder) { double(:find_or_create => true) }

    subject(:session_creator) { CreateUserSession.new(auth_data, controller, builder) }

    it 'find or creates the user associated with the session' do
      expect(builder).to receive(:find_by_nickname).with('marcosccm').and_return(user)
      session_creator.run
    end

    it 'handles the created user back to caller' do
      builder.stub(:find_by_nickname => user)
      expect(controller).to receive(:session_created).with(user)
      session_creator.run
    end

  end
end
