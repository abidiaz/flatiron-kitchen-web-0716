class RecipesController < ApplicationController
def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.create(set_params)
    redirect_to recipes_path
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(set_params)
    redirect_to recipe_path(@recipe)
  end

private 
  def set_params
    params.require(:recipe).permit(:name, :ingredient_ids=>[])
  end


end
