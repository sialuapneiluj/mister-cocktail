class CocktailsController < ApplicationController
  
  before_action :set_cocktail, only: [:show, :edit, :destroy]

  def index
  	@cocktails = Cocktail.all.order(name: :asc)
  end

  def show
  	@dose = Dose.new
  	@ingredients = Ingredient.all.order(:name)
  end

  def new
  	@cocktail = Cocktail.new
  end

  def create
  	cocktail = Cocktail.new(cocktail_params)
  	if cocktail.valid?
  		cocktail.save
  		redirect_to cocktail_path(cocktail)
  	else
  		@errors = cocktail.errors.full_messages  
  		render 'new'
  	end
  end

  def destroy
  	@cocktail.destroy
  	redirect_to cocktails_path  	
  end

  private

  def set_cocktail
  	@cocktail = Cocktail.find(params[:id])  	
  end

  def cocktail_params
  	params.require(:cocktail).permit(:name)  	
  end
end
