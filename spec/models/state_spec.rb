require 'spec_helper'

describe State do
	
	before do 
		@country = Country.create(iso_code: "US", name: "United States" )
		@state = State.new(country_iso_code: "US", state_code: "CA", name: "California")
	end

	subject { @state }

	it { should respond_to(:state_code) }
	it { should respond_to(:name) }
	it { should respond_to(:country_iso_code) }

	it { should be_valid }

	describe "when country iso code is not present" do
		before { @state.country_iso_code = "" }

		it { should_not be_valid }
	end

	describe "when state code is not present" do
		before { @state.state_code = "" }

		it { should_not be_valid }
	end

	describe "when name is not present" do
		before { @state.name = "" }

		it { should_not be_valid }
	end

	describe "when country iso code is longer than 3 characters" do
		before { @state.country_iso_code = "C" * 4 }

		it { should_not be_valid }
	end

	describe "when country iso code does not match any existing country" do
		unexisting_country = Country.find_by_iso_code('XX')

		unexisting_country.nil?
	end

	describe "when name is longer than 50 characters" do
		before { @state.name = "S" * 51 }

		it { should_not be_valid }
	end

	describe "when state code is already taken in a given country" do
		
		 before do
		 	@test_state = State.create(country_iso_code: "US", state_code: "CA", name:"California") 
		 	@repeated_state_code = State.new(country_iso_code: "US", state_code: "CA", name: "California 2")
		 end

		 subject { @repeated_state_code }
		
		
		it { should_not be_valid }
	end

	describe "when state code is already taken but in a different country" do

		before do 
			@test_state = State.create(country_iso_code: "US", state_code: "CA", name: "California")
			@unrepeated_state_code = State.new(country_iso_code: "SU", state_code: "CA", name: "Kalifornia")
		end

		subject { @unrepeated_state_code }

		it { should be_valid }
	end

end