class ClinicController < ApplicationController
  def index
    @clinics = {}

    Clinic.all.each do |clinic|
      @clinics[clinic.title_hash] = clinic.attributes.except('created_at', 'title_hash', 'id')
    end

    render json: @clinics
  end

  def show
    @record = Clinic.find_by_title_hash(allowed_params)
    @record = @record.attributes.except('created_at', 'title_hash', 'id')
    render json: @record
  end

  private

  def allowed_params
    params.permit(:id).require(:id)
  end
end
