class MongoConnection
  include Mongo

  def self.setup(configuration)
    client = MongoClient.new(configuration.fetch(:host), configuration.fetch(:port))
    @db    = client[configuration.fetch(:database)]
    if configuration[:user]
      @db.authenticate(configuration[:user])
    end
  end

  def self.collection(coll_name)
    @db[coll_name]
  end

  def self.drop_all
    @db.collections.each(&:drop)
  end
end

