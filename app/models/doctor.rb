# frozen_string_literal: true

class Doctor < ApplicationRecord
  belongs_to :specialty, optional: true
  has_many :appointments
  has_many :patients, through: :appointments

  def doctor_with_specialty_and_location
    "Dr. #{full_name} (#{specialty.name}) - #{location_city}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
