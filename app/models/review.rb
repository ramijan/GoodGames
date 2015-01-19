class Review
  include Mongoid::Document
  field :rating, type: Integer
  field :title, type: String
  field :body, type: String
  belongs_to :user
  belongs_to :game

  validates_presence_of :rating
end
