require 'rails_helper'

RSpec.describe 'Doctor Show Page', type: :feature do
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

  it 'when in the doctors show page, I see all of that doctors information' do
    visit doctor_path(@doctor1)
    within "#doctor-info" do
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor1.specialty)
      expect(page).to have_content(@doctor1.university)
      expect(page).to_not have_content(@doctor2.name)
      expect(page).to_not have_content(@doctor3.name)
      expect(page).to_not have_content(@doctor4.name)
    end 
  end

  it 'when in the doctors show page, I see the name of the hospital where the doctor works' do
    visit doctor_path(@doctor1)
    within "#doctor-info" do
      expect(page).to have_content(@doctor1.hospital.name)
    end
  end

  it 'when in the doctor show page, I see the name of all of the patients this doctor has' do
    visit doctor_path(@doctor1)
    within "#patients" do
      save_and_open_page
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_content(@patient3.name)
      expect(page).to have_content(@patient4.name)
    end
  end
end