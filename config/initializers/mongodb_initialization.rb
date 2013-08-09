config = Configuration.new

MongoConnection.setup(
  host: config['MONGO_HOST'],
  port: config['MONGO_PORT'],
  database: config['MONGO_DATABASE'],
  user: config['MONGO_USER'],
  password: config['MONGO_PASSWORD']
)

