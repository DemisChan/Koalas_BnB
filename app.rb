# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "database_connection"
<<<<<<< Updated upstream
require "animals_table"
require "animal_entity"
=======
require "property_list"
require "property"
require "user"
require "user_list"
>>>>>>> Stashed changes

class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride

  configure :development do
    # In development mode (which you will be running) this enables the tool
    # to reload the server when your code changes
    register Sinatra::Reloader

    # In development mode, connect to the development database
    db = DatabaseConnection.new("localhost", "web_application_dev")
    $global = { db: db }
  end

  configure :test do
    # In test mode, connect to the test database
    db = DatabaseConnection.new("localhost", "web_application_test")
    $global = { db: db }
  end

  def animals_table
    $global[:animals_table] ||= AnimalsTable.new($global[:db])
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

  # EXAMPLE ROUTES

<<<<<<< Updated upstream
  get '/animals' do
    erb :animals_index, locals: { animals: animals_table.list }
=======
  get '/registrations/new' do
    erb(:user_register)
  end

  post '/registrations' do
    user = User.new(username: params[:username])
    user.password = params[:password]
    if users_table.add(user)
      session[:user_id] = user.id
      redirect('/properties')
    else
      redirect('/registrations/new')
    end
  end

  get '/properties' do
    erb :property_index, locals: { properties: property_table.list }
>>>>>>> Stashed changes
  end

  get '/animals/new' do
    erb :animals_new
  end

  post '/animals' do
    animal = AnimalEntity.new(params[:species])
    animals_table.add(animal)
    redirect '/animals'
  end

  delete '/animals/:index' do
    animals_table.remove(params[:index].to_i)
    redirect '/animals'
  end

  get '/animals/:index/edit' do
    animal_index = params[:index].to_i
    erb :animals_edit, locals: {
      index: animal_index,
      animal: animals_table.get(animal_index)
    }
  end

<<<<<<< Updated upstream
  patch '/animals/:index' do
    animal_index = params[:index].to_i
    animals_table.update(animal_index, params[:species])
    redirect '/animals'
=======
  patch '/properties/:index' do
    properties_index = params[:index].to_i
    property_table.update(
    properties_index, params[:name], params[:address], params[:price], params[:description])
    redirect '/properties'
>>>>>>> Stashed changes
  end
end
