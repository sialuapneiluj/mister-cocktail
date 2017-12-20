class DosesController < ApplicationController
  

  def create
  	@cocktail = Cocktail.find(params[:cocktail_id])
   	@dose = Dose.new(dose_params)
  	@dose.cocktail = @cocktail
  	if @dose.valid?
  		@dose.save
  		redirect_to cocktail_path(@cocktail)
  	else
  		@errors = @dose.errors.full_messages 
  		render 'cocktails/show'
  	end
  end

  def destroy
  	dose = Dose.find(params[:id])
  	cocktail = Cocktail.find(dose.cocktail_id)
  	dose.destroy
  	redirect_to cocktail_path(cocktail)
  end

  private

  
  def dose_params
  	params.require(:dose).permit(:ingredient_id, :description)  	
  end
end
