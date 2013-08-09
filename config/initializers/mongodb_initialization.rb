MongoConnection.setup(
  host: ENV['MONGO_HOST'],
  port: ENV['MONGO_PORT'],
  database: ENV['MONGO_DATABASE'],
  user: ENV['MONGO_USER'],
  password: ['MONGO_PASSWORD']
)

