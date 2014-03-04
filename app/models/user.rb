class User < ActiveRecord::Base
  before_create :ensure_authentication_token
  devise :token_authenticatable, :database_authenticatable

  validates :name, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, email: true, uniqueness: true

  def to_json(options = nil)
    super(:only=>[:id,:name,:email,:authentication_token])
  end
end
