class Doctor < ApplicationRecord
  belongs_to :specialty, optional: true
  has_many :appointments
  has_many :patients, through: :appointments

  def full_name
    "#{first_name} #{last_name}"
  end
  
end
