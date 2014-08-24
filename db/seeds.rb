# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  # MySQL and PostgreSQL
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")

  # SQLite
  # ActiveRecord::Base.connection.execute("DELETE FROM #{table}")
end


Patient.create(first_name: 'Kim', last_name: 'Kardashian', unique_id: 12345)
Patient.create(first_name: 'Bosco', last_name: 'Sanchez', unique_id: 12346)
Patient.create(first_name: 'Queen', last_name: 'Elizabeth', unique_id: 12347)
Patient.create(first_name: 'The', last_name: 'Rock', unique_id: 12348)
Patient.create(first_name: 'Vinay', last_name: 'Iscool', unique_id: 12349)

Diagnosis.create(name: 'Myocardial Infarction')
Diagnosis.create(name: 'Tuberculosis')
Diagnosis.create(name: 'Narcissism')
Diagnosis.create(name: 'Acute Rheumatic Fever')
Diagnosis.create(name: 'Hypertension')

Medication.create(name: 'Paxil')
Medication.create(name: 'Lipitor')
Medication.create(name: 'Vicodin')
Medication.create(name: 'Metformin')
Medication.create(name: 'Ambien')

PatientDiagnosis.create(patient_id: Patient.where(:first_name => 'Kim').take.id, 
	                      diagnosis_id: Diagnosis.where(:name => 'Hypertension').take.id, 
	                      soap: 'Disrupt jean shorts put a bird on it salvia American Apparel, Shoreditch deep v gluten­free normcore gentrify PBR butcher cornhole shabby chic. Dreamcatcher bespoke beard, craft beer slow­carb locavore forage mixtape Neutra wayfarers.',effective_date: '23 Aug 2014', 
	                      cleared_date: '25 Aug 2014')

PatientDiagnosis.create(patient_id: Patient.where(:first_name => 'Bosco').take.id, 
	                      diagnosis_id: Diagnosis.where(:name => 'Acute Rheumatic Fever').take.id, 
	                      soap: 'Chia leggings tattooed actually, bicycle rights drinking vinegar disrupt try­hard cornhole pork belly Bushwick lo­fi 8bit seitan.', effective_date: '19 Aug 2014', 
	                      cleared_date: '20 Aug 2014')

PatientDiagnosis.create(patient_id: Patient.where(:first_name => 'Kim').take.id, 
	                      diagnosis_id: Diagnosis.where(:name => 'Narcissism').take.id, 
	                      soap: 'Chillwave Portland Etsy pickled typewriter Echo Park.', effective_date: '19 Aug 2014', 
	                      cleared_date: '30 Aug 2014')

PatientDiagnosis.create(patient_id: Patient.where(:first_name=> 'Vinay').take.id, 
	                      diagnosis_id: Diagnosis.where(:name => 'Tuberculosis').take.id, 
	                      soap: 'Occupy Schlitz lo­fi flexitarian sartorial letterpress. Lomo tousled polaroid pork belly, Pitchfork aesthetic dreamcatcher ennui seitan post­ironic organic mlkshk.', effective_date: '19 Aug 2014', cleared_date: '30 Aug 2014')

PatientDiagnosis.create(patient_id: Patient.where(:first_name=> 'Queen').take.id, 
	                      diagnosis_id: Diagnosis.where(:name => 'Myocardial Infarction').take.id, 
	                      soap: 'Cornhole brunch mlkshk, drinking vinegar Bushwick craft beer letterpress cray chambray gastropub High Life Truffaut trust fund. Artisan roof party Tumblr PBRB trust fund ugh American Apparel, viral typewriter asymmetrical tattooed cliche bespoke Bushwick Odd Future.', 
	                      effective_date: '11 Aug 2014', 
	                      cleared_date: '15 Aug 2014')

PatientMedication.create(patient_id: Patient.where(:first_name=> 'Queen').take.id, 
	                       medication_id: Medication.where(:name => 'Ambien').take.id, 
	                       regimen: 'Disrupt put a bird on it jean shorts shabby chic chillwave' , 
	                       begin_date: '15 Aug 2014' , 
	                       end_date: '18 Aug 2014' )

PatientMedication.create(patient_id: Patient.where(:first_name=> 'The').take.id, 
	                       medication_id: Medication.where(:name => 'Metformin').take.id, 
	                       regimen: 'next level pickled bitters sriracha wolf scenester mumblecore pug biodiesel.' , 
	                       begin_date: '13 Aug 2014' , 
	                       end_date: '23 Oct 2014' )

PatientMedication.create(patient_id: Patient.where(:first_name=> 'Kim').take.id, 
	                       medication_id: Medication.where(:name => 'Vicodin').take.id, 
	                       regimen: 'Kickstarter hoodie Tumblr, Intelligentsia artisan Pinterest Truffaut food truck cred iPhone.' , 
	                       begin_date: '18 Aug 2014' , 
	                       end_date: '15 Nov 2014' )

PatientMedication.create(patient_id: Patient.where(:first_name=> 'Kim').take.id, 
	                       medication_id: Medication.where(:name => 'Paxil').take.id, 
	                       regimen: 'Cray Truffaut brunch twee, authentic chia blog tofu pickled.' , 
	                       begin_date: '29 Aug 2014' , 
	                       end_date: '30 Dec 2014' )

PatientMedication.create(patient_id: Patient.where(:first_name=> 'Vinay').take.id, 
	                       medication_id: Medication.where(:name => 'Lipitor').take.id, 
	                       regimen: 'Actually stumptown Kickstarter blog normcore twee, drinking vinegar Brooklyn.' , begin_date: '18 Nov 2014' , 
	                       end_date: '20 Nov 2014' )

# Contact.create(patient_id: 1, contact_name: 'Beyonce' , address: '565 Seneca Drive, Portland, OR 97232' , relationship: 'Mother' , phone: 7705550124)

# Contact.create(patient_id: 2, contact_name: 'Robin Williams' , address: '4072 Austin Secret Lane, Heber City, UT 84032 ' , relationship: 'Father' , phone: 4042949204)

# Contact.create(patient_id: 3, contact_name: 'Jessica Alba' , address: '2210 Dancing Dove Lane, New York, NY 10013' , relationship: 'Sister' , phone: 7702834859)

# Contact.create(patient_id: 4, contact_name: 'Kanye West' , address: '1780 Straford Park, Lexington, KY 40507' , relationship: 'Brother' , phone: 6782930485)

# Contact.create(patient_id: 5, contact_name: 'Morgan Freeman' , address: '1925 Cimmaron Road, Santa Ana, CA 92701' , relationship: 'Godfather' , phone: 4049284752)