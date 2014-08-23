class Patient < ActiveRecord::Base
	has_many :contacts
	has_many :patient_diagnoses
	has_many :diagnoses, through: :patient_diagnoses
	has_many :patient_medications
	has_many :medications, through: :patient_medications
end