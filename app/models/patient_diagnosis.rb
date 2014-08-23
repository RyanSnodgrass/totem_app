class PatientDiagnosis < ActiveRecord::Base
	belongs_to :patient
	belongs_to :diagnosis
end