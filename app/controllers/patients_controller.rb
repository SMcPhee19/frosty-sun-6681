class PatientsController < ApplicationController
  def index
    @patients = Patient.where('age > ?', 18).order(:name)
  end
end
