class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :games_played, type: Array
  field :games_playing, type: Array
  field :games_want, type: Array
  has_and_belongs_to_many :games

  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
end
