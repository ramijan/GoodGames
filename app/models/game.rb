class Game
  include Mongoid::Document
  field :name, type: String
  field :deck, type: String
  field :resource_id, type: String
  # field :description, type: String
  # field :developers, type: Array
  # field :genres, type: Array
  field :image_urls, type: Hash
  field :release_date, type: Date
  field :platforms, type: Array
  # field :publishers, type: Array
end
