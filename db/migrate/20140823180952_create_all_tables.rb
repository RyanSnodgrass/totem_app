class CreateAllTables < ActiveRecord::Migration
  def change
    create_table :patients do |t|
    	t.string   :first_name
    	t.string   :last_name
    	t.string   :unique_id
    end
    create_table :diagnosis do |t|
    	t.string   :name
    end
    create_table :medications do |t|
    	t.string   :name
    end
    create_table :patient_diagnoses do |t|
    	t.integer  :patient_id
    	t.integer  :diagnosis_id
    	t.text     :soap
    	t.date     :effective_date
    	t.date     :cleared_date
    end
    create_table :patient_medications do |t|
    	t.integer  :patient_id
    	t.integer  :medication_id
    	t.text     :regimen
    	t.date     :begin_date
    	t.date     :end_date
    end
    create_table :contacts do |t|
    	t.integer  :patient_id
    	t.string   :contact_name
    	t.string   :address
    	t.string   :relationship
    	t.integer  :phone
    end
  end
end
