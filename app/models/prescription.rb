# frozen_string_literal: true

class Prescription < ApplicationRecord
  belongs_to :appointment
  validates :drug, presence: true
  validates :dosage_in_milligrams, presence: true
  validates :dosage_in_milligrams, numericality: true
end
