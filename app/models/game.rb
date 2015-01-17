class Game
  include Mongoid::Document
  field :name, type: String
  field :deck, type: String
  field :resource_id, type: String
  field :image_urls, type: Hash
  field :release_date, type: Date
  field :platforms, type: Array
  has_and_belongs_to_many :users

end
