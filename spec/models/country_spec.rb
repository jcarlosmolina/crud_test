# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  iso_code   :string(255)
#

require 'spec_helper'

describe Country do

  before { @country = Country.new(iso_code: 'ES', name: 'Espanya') }

  subject { @country }

  it { should respond_to(:iso_code) }
  it { should respond_to(:name) }

  it { should be_valid }


  describe "when iso_code is not present" do
  	before { @country.iso_code = "" }
  	
  	it { should_not be_valid }
  end

  describe "when name is not present" do
  	before { @country.name = "" }

  	it { should_not be_valid }
  end

  describe "when iso_code is longer than 3 characters" do
  	before { @country.iso_code = "A" * 4 }

  	it { should_not be_valid }
  end

  describe "when name is longer than 50 characters" do
  	before { @country.name = "a" * 51 }

  	it { should_not be_valid }
  end

  describe "when iso_code is already taken" do
  	before do
  		country_with_same_iso_code = @country.dup
  		country_with_same_iso_code.iso_code = @country.iso_code.downcase
  		country_with_same_iso_code.save
  	end

  	it { should_not be_valid }
  end
end
