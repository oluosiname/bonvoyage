class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  before_create :format_params

  def format_params
    self.email.downcase!
    self.username.capitalize!
  end
end
