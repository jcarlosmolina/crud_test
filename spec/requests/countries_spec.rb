require 'spec_helper'

describe "Countries" do

=begin
  describe "GET /countries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get countries_path
      response.status.should be(200)
    end
  end
=end

  describe "List countries" do
  	it "should have the content 'Countries'" do
  		visit countries_path
  		page.should have_content('Countries')
  	end

  	# Table header should include 'ISO' and 'Name'
  	it "should have the content 'ISO'" do
  		visit countries_path
  		page.should have_content('ISO')
  	end

  	it "should have the content 'Name'" do
  		visit countries_path
  		page.should have_content('Name')
  	end

  	# There should be a link to create a new country
  	it "should have the content 'New Country'" do
  		visit countries_path
  		page.should have_content('New Country')
  	end
  end


  describe "New country" do
    it "is pending"
    # pending "Add some tests for the 'New country' page"
  end

  describe "Show country" do
    it "is pending"
    # pending "Add some tests for the 'Show country' page"
  end

  describe "Edit country" do
    it "is pending"
    # pending "Add some tests for the 'Edit country' page"
  end

  describe "Delete country" do
    it "is pending"
    # pending "Add some tests for the 'Delete country' confirmation page"
  end


end
