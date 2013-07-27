class Challenges
  def initialize
    @collection = MongoConnection.collection('challenges')
  end

  def find(id)
    convert collection.find(_id: id).first
  end

  def current
    convert collection.find(current: true).first
  end

  def previous
    convert_all collection.find(current: false)
  end

  def all
    convert_all collection.find
  end

  def add(entry)
    id = collection.insert(entry.to_hash)
    entry._id = id
    entry
  end

  def update(entry)
    collection.update({_id: entry._id }, { '$set' =>  entry.to_hash })
  end

  private

  def convert_all(entries)
    entries.map { |e| convert(e) }
  end

  def convert(raw)
    Challenge.new(raw)
  end

  private

  def collection
    @collection
  end
end
