class StatesController < ApplicationController

	# Display a list of States
	# GET /states
	# GET /states.json
	def index
		@states = State.all

		respond_to do |format|
			format.html #index.html.erb
			format.json { render json: @states }
		end
	end

	# Display details of a single State
	# GET /states/1
	# GET /states/1.json
	def show
		@state = State.find(params[:id])

		respond_to do |format|
			format.html #show.html.erb
			format.json { render json: @state }
		end
	end

	# Display form to gather data for a new State
	# GET /states/new
	# GET /states/new.json
	def new
		@state = State.new

		respond_to do |format|
			format.html #new.html.erb
			format.json { render json: @state }
		end
	end
	
	# Create a new State
	# POST /countries
	# POST /countries.json
	def create
		@state = State.new(params[:state])
		@country = Country.find_by_iso_code(@state.country_iso_code)
		if (@country.nil?)
			format.html { render action: "new" }
			format.json { render json: @state.errors, status: :unprocessable_entity }
		else
			@state.country = @country
			@country.states.append @state
		end

		respond_to do |format|
			if @state.save && @country.save
				format.html { redirect_to @state, notice: "State was successfully created" }
				format.json { render json: @state, status: :created, location: @state }
			else
				format.html { render action: "new"}
				format.json { render json: @state.errors, status: :unprocessable_entity }
			end
		end
	end

	# Display form to gather data to edit an existing State
	# GET /states/1/edit
	# GET /states/1/edit.json
	def edit
		@state = State.find(params[:id])
	end

	# Update an existing State
	def update
		@state = State.find(params[:id])

		if @state.country_iso_code != params[:state][:country_iso_code]
			@old_country = @state.country
			@new_country = Country.find_by_iso_code(params[:state][:country_iso_code])
			if ! @new_country.nil?
				@old_country.states.delete @state
				@old_country.save

				@new_country.states.append @state
				@new_country.save

				@state.country = @new_country
				@state.save
			end
		end

		respond_to do |format|
			if @state.update_attributes(params[:state])
				format.html { redirect_to @state, notice: "State was successfully updated" }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @state.errors, status: :unprocessable_entity }
			end
		end
	end

	# Destroy an existing State
	# DELETE /states/1
	# DELTE /states/1.json
	def destroy
		@state = State.find(params[:id])

		@country = @state.country
		@country.states.delete @state

		@country.save
		@state.destroy

		respond_to do |format|
			format.html { redirect_to states_url }
			format.json { head :no_content }
		end
	end

end
