

class Person
	@@person = []
	attr_accessor :person, :name, :politic

	def initialize(name, politic)
		@name = name
		@politic = politic
		@@person << self
	end

	def self.all    # initializes access to the person class array so it's accessible in the list method when we call Person.all.each do |personobject|
		@@person
	end
end

class Politician
	@@politician = []
	attr_accessor :politician, :name, :affiliation

	def initialize(name, affiliation)
		@name = name
		@affiliation = affiliation
		@@politician << self
	end

	def self.all     # initializes access to the person class array so it's accessible in the list method when we call Politician.all.each do |politicianobject|
		@@politician
	end
end

	def decision
		puts "Choose from the menu by entering a number:"
		puts "[1] - Create"
		puts "[2] - List"
		puts "[3] - Update"
		puts "[4] - Vote"
		puts "[5] - Exit"
		case gets.chomp
		when "1"
			create
		when "2"
			list
		when "3"
			update
		when "4"
			vote
		when "5"
			exit
		else
			puts "Please enter a number."
		end
	end

	def create
		puts "Please enter Person or Politician:"
		input = gets.chomp.downcase
		
		if  input == "politician"
			puts "What's your name?"
			name = gets.chomp.capitalize
			puts "Democrat or Republican?"
			affiliation = gets.chomp.downcase
			Politician.new(name, affiliation)
			decision
		elsif input == "person"
			puts "What's your name?"
			name = gets.chomp.capitalize
			puts "Choose: Liberal, Conservative, Tea_Party, Socialist, Independent"
			politic = gets.chomp.downcase
			Person.new(name, politic)
			decision

		else	
			puts "-Invalid entry-"
			create
		end
	end

	def list
		#Amy showing how to access instance variables in the class
		Person.all.each do |personobject|
		puts "#{personobject.name},  #{personobject.politic}" 
		end
		Politician.all.each do |politicianobject|
		puts "#{politicianobject.name},  #{politicianobject.affiliation}"
		end
		decision
	end

	def update_name(object)
		puts "Please enter corrected name."
		object.name = gets.chomp.downcase
	end

	def update_politic(object)
		puts "Please enter corrected politics."
		object.politic = gets.chomp.downcase
		puts "Your new politics is #{object.politic}."
	end

	def update_affiliation(object)
		puts "Please enter corrected party."
		object.affiliation = gets.chomp.downcase
		puts "Your new party is #{object.affiliation}."
	end


	def update
		puts "To update your information, please enter your name."
		input = gets.chomp.downcase
		(Person.all + Politician.all).each do |object|
			if object.name.downcase == input

				puts "Would you like to update your name? [yes, no]"
				(gets.chomp.downcase == "yes") ? update_name(object) : false

				if object.class == Person
					puts "Would you like to update your politics? [yes, no]"
					(gets.chomp.downcase == "yes") ? update_politic(object) : false
				else
					puts "Would you like to update your party? [yes, no]"
					(gets.chomp.downcase == "yes") ? update_affiliation(object) : false
				end
			end
		end
	end



loop do
	decision
end


