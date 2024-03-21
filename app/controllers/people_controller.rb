class PeopleController < ApplicationController
	def index
		@people = Person.all.order(first_name: :asc)
	end
	def show
		@person = Person.find(params[:id])
	end
	def new
		@person = Person.new
	end
	def create
		@person = Person.new(person_params)
		if @person.save
			redirect_to root_path
		else  
			render :new, status: :unprocessable_entity
		end
	end
	def edit
		@person = Person.find(params[:id])
	end
	def update
		if @person.update(person_params)
			redirect_to root_path
		else
			render :edit, status: :unprocessable_entity
		end
	end
	private
		def person_params
			params.require(:person).permit(:first_name, :last_name, :email)
		end
end
