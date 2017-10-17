require_relative 'patient'
spacer = "***********"

new_patient = Patient.new("Jisie", "David")
puts new_patient.first_name
puts spacer

puts new_patient.last_name
puts spacer

begin
    puts patient_contact_info
rescue NameError => e
	puts "Exception message: #{e.message}"
    puts "Exception backtrace: #{e.backtrace}"
end
puts spacer

puts new_patient.patient_status(:coma)
puts spacer

begin
	puts new_patient.patient_currently_admitted?
rescue ArgumentError => e
	puts "Exception message: #{e.message}"
	puts "Exception backtrace: #{e.backtrace}"
end
puts spacer

puts new_patient.patient_new_total(125)
puts spacer

new_patient.add_med_to_list("lipitor", 123.12)
puts spacer

new_patient.patient_medications_list
puts spacer

# Run main.rb and handle all raised exceptions. 
# Pay attention to the comments that provide additional info/directions. 
# You should not change the code to fix the errors but handle all exceptions with proper exception handling.
