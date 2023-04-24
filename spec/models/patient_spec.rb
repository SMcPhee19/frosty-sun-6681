require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do
    it { should have_many :patient_doctors }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  before(:each) do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Seaside Health & Wellness Center")

    @doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
    @doctor2 = @hospital1.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University")
    @doctor3 = @hospital2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor4 = @hospital2.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania")

    @patient1 = Patient.create!(name: "Katie Bryce", age: 24)
    @patient2 = Patient.create!(name: "Denny Duquette", age: 39)
    @patient3 = Patient.create!(name: "Rebecca Pope", age: 32)
    @patient4 = Patient.create!(name: "Zola Shepherd", age: 2)

    PatientDoctor.create!(patient: @patient1, doctor: @doctor1)
    PatientDoctor.create!(patient: @patient2, doctor: @doctor1)
    PatientDoctor.create!(patient: @patient3, doctor: @doctor1)
    PatientDoctor.create!(patient: @patient4, doctor: @doctor1)
    PatientDoctor.create!(patient: @patient1, doctor: @doctor2)
    PatientDoctor.create!(patient: @patient2, doctor: @doctor2)
    PatientDoctor.create!(patient: @patient3, doctor: @doctor2)
    PatientDoctor.create!(patient: @patient4, doctor: @doctor2)
    PatientDoctor.create!(patient: @patient1, doctor: @doctor3)
    PatientDoctor.create!(patient: @patient2, doctor: @doctor3)
    PatientDoctor.create!(patient: @patient3, doctor: @doctor3)
    PatientDoctor.create!(patient: @patient2, doctor: @doctor4)
    PatientDoctor.create!(patient: @patient3, doctor: @doctor4)
    PatientDoctor.create!(patient: @patient4, doctor: @doctor4)
  end

  describe 'class methods' do
    it '#sort_by_age' do
      expect(Patient.sort_by_age).to eq([@patient2, @patient1, @patient3])
    end
  end 
end
