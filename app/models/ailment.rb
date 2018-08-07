class Ailment < ApplicationRecord
  belongs_to :patient
  has_many :appointments

  def self.for_current_user(current_user)
    self.all.select do |ailment|
      ailment.patient == current_user.role
    end
  end

  def time_since_first_noticed
    result = (Date.today - self.first_noticed_on).to_i
    if result <= 31
      "#{result} days"
    elsif result > 31 && result <= 90
      w_result = result/7
      "#{w_result} weeks"
    elsif result > 90 && result <= 540
      m_result = result/30
      "#{m_result} months"
    else
      y_result = result/365
      "#{y_result} years"
    end
  end

end
