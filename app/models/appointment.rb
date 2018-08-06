class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :ailment
  has_many :prescriptions

  def self.for_current_user(current_user)
    self.all.select do |appointment|
      appointment.doctor == current_user.role
    end
  end

  def date_and_patient
    "#{self.scheduled_for.strftime("%A, %b. %-d, %Y @ %l:%M %P")} (#{self.patient.full_name})"
  end

end
