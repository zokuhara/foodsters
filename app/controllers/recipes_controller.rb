class RecipesController < ApplicationController

  before_action :authenticate_user!

  def index
    # some number of random recipes
  end

  def show
    #specific recipe details
    @recipe = Yummly.find params[:id]
  end

  def search
    q = params[:q]
    @recipes = Yummly.search(q)
  end
end
