require 'sinatra'
require 'yhat'
require 'json'

# Create a Yhat client so we can call the beer model
enterprise_url = "http://starphleet-aa02a554-1463294931.us-west-1.elb.amazonaws.com/"
yh = Yhat.new("greg", "testing123", enterprise_url) 

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  erb :index
end

get '/:name' do |n|
  # params[:name] is 'foo' or 'bar'
  # n stores params[:name]
  content_type :json
  yh.predict("PydataBeerRec", { "beer" => n }.to_json).to_json
end

post '/' do
  content_type :json
  data = request.body.read
  yh.predict("PydataBeerRec", data).to_json
end
