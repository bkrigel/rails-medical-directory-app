# frozen_string_literal: true

class Prescription < ApplicationRecord
  belongs_to :appointment
end
