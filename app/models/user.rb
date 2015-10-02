class User < ActiveRecord::Base
  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true
  validates :email, format: RFC822::EMAIL
end
