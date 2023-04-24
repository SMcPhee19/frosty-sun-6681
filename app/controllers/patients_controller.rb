class PatientsController < ApplicationController
  def index
    @patients = Patient.sort_by_age
  end
end
