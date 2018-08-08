# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :specialty, optional: true
  has_many :appointments
  has_many :patients, through: :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location_city, presence: true

  def doctor_with_specialty_and_location
    "Dr. #{full_name} (#{specialty.name}) - #{location_city}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
