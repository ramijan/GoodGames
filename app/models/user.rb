class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :games_played, type: Array, default: []
  field :games_playing, type: Array, default: []
  field :games_want, type: Array, default: []
  has_and_belongs_to_many :games
  has_many :reviews

  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def get_list_location(game)
    if self.games_played.include?(game.id.to_s)
      return :games_played
    elsif self.games_playing.include?(game.id.to_s)
      return :games_playing
    elsif self.games_want.include?(game.id.to_s)
      return :games_want
    else
      return nil
    end
  end


end
