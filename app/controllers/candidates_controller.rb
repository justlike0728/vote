class CandidatesController < ApplicationController

	def index
		@candidates = Candidate.all
	end

	def show
		@candidate = Candidate.find_by(id: params[:id])
	end

	def new
		@candidate = Candidate.new
	end

	def create
		@candidate = Candidate.new(candidate_params)

		if @candidate.save
			flash[:notice] = "Candidate Created!"
			redirect_to '/candidates'
		else
			render :new
		end
	end

	def edit
		@candidate = Candidate.find_by(id: params[:id])
	end

	def update
		@candidate = Candidate.find_by(id: params[:id])

		if @candidate.update(candidate_params)
			flash[:notice] = "Candidate Update!"
			redirect_to '/candidates'
		else
			render :edit
		end
	end

	def destroy
		@candidate = Candidate.find_by(id: params[:id])

		@candidate.destroy
			flash[:notice] = "Candidate Delete!"
			redirect_to '/candidates'
	end

	private
	def candidate_params
		params.require(:candidate).permit(:name, :party, :age, :politics)
	end
end