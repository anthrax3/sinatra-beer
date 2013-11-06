require 'sinatra'
require 'yhat'
require 'json'

# Create a Yhat client so we can call the beer model
enterprise_url = "http://enterprise-demo.yhathq.com/"
yh = Yhat.new("greg", "demoaccount", enterprise_url) 

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
  erb :index
end

post '/' do
  content_type :json
  data = JSON.parse(request.body.read)
  yh.predict("BeerRec", data).to_json
end
