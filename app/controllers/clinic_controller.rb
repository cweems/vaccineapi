class ClinicController < ApplicationController
  def index
    @clinics = {}

    Clinic.all.each do |clinic|
      @clinics[clinic.id] = clinic
    end
    render json: @clinics
  end
end
