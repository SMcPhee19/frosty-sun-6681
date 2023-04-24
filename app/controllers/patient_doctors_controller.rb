class PatientDoctorsController < ApplicationController
  def destroy
    # require 'pry'; binding.pry
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:patient_id])
    @pateint_doctor = PatientDoctor.find_by(doctor_id: @doctor.id, patient_id: @patient.id)
    @pateint_doctor.destroy
    redirect_to doctor_path(@doctor)
  end
end
