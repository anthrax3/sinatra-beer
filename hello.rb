require 'sinatra'
require 'yhat'
require 'json'

yh = Yhat.new("greg", "testing123", "http://starphleet-aa02a554-1463294931.us-west-1.elb.amazonaws.com/")
get '/' do
  content_type :json
  # beer = params[:name]
  beer = "Coors Light"
  yh.predict("PydataBeerRec", { "beer" => beer }.to_json).to_json
end
