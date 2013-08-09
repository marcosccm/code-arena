class MongoConnection
  include Mongo

  def self.setup(configuration)
    client = Mongo::Client.connect("mongodb://test:whocares@ds037698.mongolab.com:37698/heroku_app8687179")
    @db    = client[configuration.fetch(:database)]
    if configuration[:user]
      @db.authenticate(configuration[:user], configuration[:password])
    end
  end

  def self.collection(coll_name)
    @db[coll_name]
  end

  def self.drop_all
    @db.collections.each(&:drop)
  end
end

