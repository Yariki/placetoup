require_relative '../helpers/extension_methods'
require_relative '../helpers/category_helper'
require 'json'
require 'google_places'
require_relative '../infrastrusture/infrastructure_response'

include Helpers
include Infrastructure

get '/api' do
  {
      message: 'Welcome to PlaceToUp'
  }.to_json

end

get '/api/categories' do

  result = nil
  begin
    helperCategory = Helpers::CategoryHelper.new
    localCategoies = helperCategory.get_categories
    count = localCategoies.count
    arr  = Array.new(count)
    i = 0
    localCategoies.each_key do |key|
      arr[i] = {type: key, name: localCategoies[key]}
      i+=1
    end
    result = OkResponseResult.new(arr.to_json)
  rescue  Exception => e
    result = FailerResponseResult.new(@@ERROR_INTERNAL_SERVER_ERROR,e.message)
  end
  result.to_json
end

get '/api/place/:lat/:lng' do

  result = nil
  begin
    client = GooglePlaces::Client.new(GOOGLE_API_KEY)
    response = client.spots(params[:lat],params[:lng])
    arr = Array.new(response.length)
    response.each_index{|i| arr[i] =  spot_to_json(response[i])}
    result = OkResponseResult.new(arr.to_json)
   rescue Exception => e
    result = FailerResponseResult.new(@@ERROR_INTERNAL_SERVER_ERROR,e.message)
  end
  result.to_json
end

post '/api/place' do
  result = nil
  begin
    client = GooglePlaces::Client.new(GOOGLE_API_KEY)
    puts params[:lat]
    puts params[:lng]
    puts params[:categories]
    response = client.spots(params[:lat],params[:lng],{ :types => params[:categories]})
    arr = Array.new(response.length)
    response.each_index{|i| arr[i] =  spot_to_json(response[i])}
    result = OkResponseResult.new(arr.to_json)
  rescue Exception => e
    result = FailerResponseResult.new(@@ERROR_INTERNAL_SERVER_ERROR,e.message)
  end
  result.to_json
end



