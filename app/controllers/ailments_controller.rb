class AilmentsController < ApplicationController

  def new
    @ailment = Ailment.new
  end

end
