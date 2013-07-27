require 'spec_helper'

describe Challenges do
  let(:challenges) { Challenges.new }

  describe 'adding a challenge' do
    it 'creates a register in the database' do
      challenge = Challenge.new(title: 'O desafio')
      challenges.add(challenge)

      expect(challenges.all.size).to eq 1
      expect(challenge.id).to_not be_nil
    end
  end

  describe 'updating a challenge' do
    it 'updates the collection entry with the same id' do
      challenge = Challenge.new(title: 'O desafio')
      challenges.add(challenge)

      challenge.title = 'O trem'
      challenges.update(challenge)

      updated = challenges.find(challenge._id)
      expect(updated.title).to eq 'O trem'
    end
  end

  describe 'dealing with current challenge' do
    let(:existent_challenges) do  
      [ 
        Challenge.new(title: 'c1'),
        Challenge.new(title: 'c2', current: true),
        Challenge.new(title: 'c3')
      ]
    end

    before do
      existent_challenges.each { |c| challenges.add(c) }
    end

    it 'returns the first challenge marked as current' do
      current = challenges.current
      expect(current.title).to eq 'c2'
    end

    it 'returns other challenges as previous' do
      expect(challenges.previous.size).to eq 2
    end
  end
end
