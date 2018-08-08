# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  belongs_to :role, polymorphic: true
  accepts_nested_attributes_for :role
  validates :email, uniqueness: true
end
