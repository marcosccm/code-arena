class CurrentChallenge
  def self.setup(title, text)
    collection.insert(title: title, content: text, current: true)
  end

  def self.update(challenge)
    collection.update({current: true }, { '$set' =>  challenge })
  end

  def self.current
    current = collection.find(current: true).first
    current ? Challenge.new(current) : Challenge.default
  end

  private

  def self.collection
    MongoConnection.collection('challenges')
  end
end

