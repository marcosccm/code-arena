require 'spec_helper'

describe CurrentChallenge do
  describe 'setting the current challenge' do
    it 'creates a challenge and mark it as the current' do
      CurrentChallenge.setup('bla', 'blu')
      current = CurrentChallenge.current

      current.title.should == 'bla'
      current.content.should == 'blu'
    end
  end

  describe 'updating the current challenge' do
    it 'changes title and description of the current challenge' do
      CurrentChallenge.setup('bla', 'blu')
      CurrentChallenge.update(title: 'new bla', content: 'new blu')
      current = CurrentChallenge.current

      current.title.should == 'new bla'
      current.content.should == 'new blu'
    end
  end
end
