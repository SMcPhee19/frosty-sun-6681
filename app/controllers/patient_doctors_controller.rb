class PatientDoctorsController < ApplicationController
  def destroy
    @patient = Patient.find(params[:id])
    @doctor = Doctor.find(params[:id])
    @pateint_doctor = PatientDoctor.find_by(doctor_id: @doctor.id, patient_id: @patient.id)
    @pateint_doctor.destroy
    redirect_to doctor_path(@doctor)
  end
end
