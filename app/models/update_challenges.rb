class UpdateChallenges < Struct.new(:data, :challenge, :ui)
  def run
    challenge.update(data)
    ui.challenge_updated
  end
end
