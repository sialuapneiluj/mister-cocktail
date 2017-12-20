class PagesController < ApplicationController
  def home
  	@cocktails = Cocktail.all.order(name: :asc)
  end
end
