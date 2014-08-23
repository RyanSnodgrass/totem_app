class RenameDiagnosisDiagnoses < ActiveRecord::Migration
  def change
  	rename_table :diagnosis, :diagnoses
  end
end
