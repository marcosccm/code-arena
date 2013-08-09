MongoConnection.setup(
  host: ENV['MONGO_HOST'] || 'localhost',
  port: ENV['MONGO_PORT'] || '27017',
  database: ENV['MONGO_DATABASE'] || 'code-arena',
  user: ENV['MONGO_USER'],
  password: ['MONGO_PASSWORD']
)

