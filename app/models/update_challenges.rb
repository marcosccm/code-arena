class UpdateChallenges < Struct.new(:data, :challenges, :ui)
  def run
    challenge = challenges.current
    challenges.update(challenge)
    ui.challenge_updated
  end
end

