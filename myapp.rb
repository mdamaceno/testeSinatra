require 'sinatra'
require 'sinatra/json'
require "sinatra/reloader" if development?
require 'mongoid'
require 'json/ext'

# include Mongo

# configure do
#   conn = MongoClient.new("localhost", 27017)
#   set :mongo_connection, conn
#   set :mongo_db, conn.db('churchApp')
# end

Mongoid.load!("./config/mongoid.yml")

require './models/origin'

before do
  content_type :json
end

set :public_folder, File.dirname(__FILE__) + '/public'

get '/' do
  json hello: "Hello World"
end

get '/api/seguimentos' do
  @origins = Origin.find
  @origins.to_a.to_json
end
