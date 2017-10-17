class Patient
	
	attr_accessor :first_name, :last_name, :status, :current_balance, :med_list	

	def initialize(first_name, last_name)
		@first_name = first_name
		@last_name = last_name
		@med_list = []
	end	

	def patient_status(status)
		begin
			raise ArgumentError,"Argument is not a string" unless status.is_a? String	
			@status = status
		rescue ArgumentError => e
			puts "Exception message: #{e.message}"
			puts "Exception backtrace: #{e.backtrace}"
		end
	end	

	def patient_currently_admitted?(admit_time)
		puts "Patient currently in hospital, admitted at #{admit_time}"
	end	

	def patient_new_total(amount)
		begin
			@current_balance = 0
			puts "Current balance before calculation: #{current_balance}"	
			@current_balance = (current_balance + amount)/current_balance	
			# This runs only if there are no exceptions
		rescue ZeroDivisionError => e
			puts "Exception message: #{e.message}"
			puts "Exception backtrace: #{e.backtrace}"
		else
			@current_balance = amount
		end
	end	

	def add_med_to_list(med, dosage)
		begin
			raise ArgumentError,"#{med} is not a string" unless med.is_a? String	
			raise ArgumentError,"#{dosage} is not a integer" unless dosage.is_a? Integer	
			puts "Medication added: #{med}"
			@med_list.push([med,dosage])	
			#Create a new class called MedTypeError that inherits from StandardError and use that as seen below:
			raise MedTypeError, "This is not a valid medication"
			puts @med_list
		rescue ArgumentError => e
			puts "Exception message: #{e.message}"
			puts "Exception backtrace: #{e.backtrace}"
		rescue MedTypeError
			puts "Exception message: #{e.message}"
			puts "Exception backtrace: #{e.backtrace}"
		end
	end

	def patient_medications_list
		begin
			puts "User medication list:"	
			raise RuntimeError, "Medications list is not valid."
			puts @med_list
		rescue RuntimeError => e
			puts "Exception message: #{e.message}"
			puts "Exception backtrace: #{e.backtrace}"
		ensure
			# This needs to run whether there was an exception or not.
			puts "Disclaimer: The hospital is not responsible for the user's health due to medications they may be using."
		end
	end
end