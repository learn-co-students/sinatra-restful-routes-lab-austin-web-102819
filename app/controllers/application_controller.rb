class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  # display a recipe page for user to input info
  get '/recipes/new' do
    erb :new
  end

  # create action
  post '/recipes' do
    # binding.pry
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  # index action, show all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # delete action
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end


  # show action
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    # binding.pry
    erb :show
  end

  # display a recipe page for user to update info
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  # update action
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]

    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

end 