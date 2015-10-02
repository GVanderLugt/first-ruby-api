class User < ActiveRecord::Base
  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true,
                    format: RFC822::EMAIL,
                    uniqueness: true
end
