class Ailment < ApplicationRecord
  belongs_to :patient
  has_many :appointments
end
