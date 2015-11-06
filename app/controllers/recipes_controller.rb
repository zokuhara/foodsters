class RecipesController < ApplicationController

  before_action :authenticate_user!
  # also authenticate subscription

  def index
    # Plan B: Show what meals are planned for whatever period of time

  end

  def show
    #specific recipe details
    @recipe = Yummly.find params[:id]
  end

  def search
    # Plan B: We become the destination of clicking
    # the 'Search' link in the header
    q = params[:q]
    @recipes = Yummly.search(q)
  end

  def new
    @recipe = Yummly.find params[:id]
  end

  def create
    redirect_to recipes_path
  end
end
