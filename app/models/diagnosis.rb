class Diagnosis < ActiveRecord::Base
	has_many :patient_diagnoses
	has_many :patients, through: :patient_diagnoses
end