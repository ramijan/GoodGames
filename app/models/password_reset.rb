class PasswordReset
  include Mongoid::Document
  field :email, type: String
  field :token, type: String
  field :created_at, type: DateTime


  before_create :generate_token
  before_create :set_create_time

  def set_create_time
    self.created_at = DateTime.now
  end

  def generate_token
    self.token = SecureRandom.hex
  end

end
