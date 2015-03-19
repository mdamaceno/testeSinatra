#config
require 'lotus/router'
require 'mongoid'
require 'json/ext'

Mongoid.load!("./config/mongoid.yml",:development)

# Models Load
require './models/origins'

app = Lotus::Router.new(parsers: [:json]) do
  get '/', to: ->(env) { [404, {'by' => 'sds'}, [Models::Origins.all.to_json]] }
end

Rack::Server.start app: app, Port: 4567