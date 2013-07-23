require 'spec_helper'

describe GithubUsers do
  describe 'finding by nickname' do
    context 'when the user exists' do
      it 'returns existing user' do
        GithubUsers.create(nickname: 'marcosccm')
        user = GithubUsers.find_by_nickname('marcosccm')
        expect(user.nickname).to eq 'marcosccm'
      end
    end

    context 'when the user does not exist' do
      it 'returns nil' do
        user = GithubUsers.find_by_nickname('marcosccm')
        expect(user).to eq nil
      end
    end
  end
end
