class User < ApplicationRecord
  has_secure_password
  belongs_to :role, polymorphic: true
  validates :email, uniqueness: true
end
