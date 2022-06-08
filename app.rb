# These lines load Sinatra and a helper tool to reload the server
# when we have changed the file.
require 'sinatra/base'
require 'sinatra/reloader'

# You will want to require your data model class here
require "database_connection"
require "property_list"
require "property"
require "user"
require "user_list"


class WebApplicationServer < Sinatra::Base
  # This line allows us to send HTTP Verbs like `DELETE` using forms
  use Rack::MethodOverride
  
  enable :sessions

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

  def property_table
    $global[:property_table] ||= PropertyList.new($global[:db])
  end

  def users_table
    $global[:users_table] ||= UserList.new($global[:db])
  end

  # Start your server using `rackup`.
  # It will sit there waiting for requests. It isn't broken!

  # YOUR CODE GOES BELOW THIS LINE

  # EXAMPLE ROUTES

  get '/users/new' do
    erb :user_register, locals: { users: session[:user_id] }
  end

  post '/users' do
    user = User.new(
      params[:username], 
      params[:password], 
      params[:email], 
      params[:number], 
      params[:first_name], 
      params[:last_name])

      session[:user_id] = users_table.add(user)
      redirect '/users/profile'

  end

  get '/users/profile' do
    user = users_table.get(session[:user_id])
    erb :'profile', locals: {user: user}
  end

  get '/users/login' do
    erb :'login'
  end

  post '/users/login' do
    user = users_table.find_by(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/properties'
    end
    redirect '/users/login'
  end

  get '/users/logout' do
    session.clear
    redirect '/properties'
  end

  get '/properties' do
    erb :property_index, locals: { properties: property_table.list }
  end

  get '/properties/new' do
    erb :property_new
  end

  post '/properties' do
    property = Property.new(params[:name],params[:address],params[:price],params[:description])
    property_table.add(property)
    redirect '/properties'
  end

  delete '/properties/:index' do
    property_table.remove(params[:index].to_i)
    redirect '/properties'
  end

  get '/properties/:index/edit' do
    properties_index = params[:index].to_i
    erb :property_edit, locals: {
      index: properties_index,
      property: property_table.get(properties_index)
    }
  end

  patch '/properties/:index' do
    properties_index = params[:index].to_i
    property_table.update(
    properties_index, params[:name], params[:address], params[:price], params[:description])
    redirect '/properties'
  end

  patch '/properties/:index' do
    properties_index = params[:index].to_i
    property_table.update(properties_index, params[:name], params[:address], params[:price], params[:description])
    redirect '/properties'
  end
end
