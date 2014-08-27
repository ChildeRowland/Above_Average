class Profile < ActiveRecord::Base
	
	validates :fname,
		:presence => 
		{:message => "Your first name cannot be left blank."}

	validates :age,
		:numericality =>
		{:message => "Put your age in numbers only please, with no symbols, spaces, or letters."}


	validates :zip,
		:length => { :is => 5, :message => "Please use your 5 digit zip code." },
		:numericality =>
		{:message => "Put your zip code in numbers only please, with no symbols, spaces, or letters."}


	# validates_exclusion_of :total_household_members

	validates :total_household_members,
		:exclusion => { :in => ( -100..0 ), 
			:message => "If you live alone, put 1." },
		:numericality =>
		{:message => "How many people in the household only accepts numbers, without symbols, spaces, or letters."}


 # validates :subdomain, exclusion: { in: %w(www us ca jp),
 #    message: "%{value} is reserved." }
 #validates :name, length: { minimum: 2 }


	belongs_to :user

end
