class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  field :api_detail_url, type: String
  field :deck, type: String
  field :expected_release_day, type: Integer
  field :expected_release_month, type: Integer
  field :expected_release_quarter, type: Integer
  field :expected_release_year, type: Integer
  field :giant_bomb_id, type: Integer
  field :image, type: Hash
  field :name, type: String
  field :original_release_date, type: DateTime
  field :platforms, type: Array
  field :site_detail_url, type: String
  has_and_belongs_to_many :users

  validates :giant_bomb_id, uniqueness: true

end
