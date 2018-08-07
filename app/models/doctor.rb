class Doctor < ApplicationRecord
  belongs_to :specialty, optional: true
  has_many :appointments
  has_many :patients, through: :appointments

  def doctor_with_specialty_and_location
    "Dr. #{self.full_name} (#{self.specialty.name}) - #{self.location_city}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
