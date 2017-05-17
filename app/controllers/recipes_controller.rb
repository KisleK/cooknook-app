class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

  sort_attribute = params[:sort]
    if sort_attribute
      @recipes = Recipe.all.order(sort_attribute)
    end

  end

  def show
    recipe_id = params[:id]
    @recipe = Recipe.find_by(id: recipe_id)
  end

  def new
    
  end

  def create
    recipe = Recipe.new(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions]
                        )
    recipe.save
    flash[:success] = "Recipe Successfully Created"
    redirect_to "/recipes/#{ recipe.id }" #why do we utilize a space between { aand recipe here but not line 3 in edit.html.erb
    #since render is implicit and here even when it is not typed. could we have just written render 'show.html.erb'?
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.assign_attributes(
                             title: params[:title],
                             chef: params[:chef],
                             ingredients: params[:ingredients],
                             directions: params[:directions]
                             )
    recipe.save
    flash[:success] = "Recipe Successfully Updated"
    redirect_to "/recipes/#{ recipe.id }"
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:warning] = "Recipe Destroyed"
    redirect_to "/"
  end

  def method_name
    
  end
end







