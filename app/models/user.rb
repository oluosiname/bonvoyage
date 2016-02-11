class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true

  before_create :format_params

  private

  def format_params
    email.downcase!
    username.capitalize!
  end
end
