class Game
  include Mongoid::Document
  include Mongoid::Timestamps
  field :giant_bomb_game_id, type: String
  field :image, type: Hash
  field :name, type: String
  field :publisher, type: String
  field :developer, type: String
  has_and_belongs_to_many :users
  has_many :reviews

  validates :giant_bomb_game_id, uniqueness: true

  def average_rating
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end

    if reviews.count > 0
      return sum.to_f / reviews.count
    else
      return 'n/a'
    end
  end

end
