class PetsController < ApplicationController

 before_action :set_pet,only:[:show]

	def new
		@pet = Pet.new
	end
	def create
		@pet = Pet.new(pet_params)
		@pet.user_id = current_user.id
		@pet.save
		render :show
	end 
	
	def show
		
	end



	private

	def set_pet
		@pet = Pet.find(params[:id])
	end
	def pet_params
      params.require(:pet).permit(:name, :phrase, :user_id,:image,:age,:pettype)
    end
end
