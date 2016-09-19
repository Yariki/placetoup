require_relative '../helpers/extension_methods'
require_relative '../helpers/category_helper'
require 'json'
require 'google_places'

include Helpers

get '/api' do
  {
      message: 'Welcome to PlaceToUp'
  }.to_json

end

get '/api/categories' do
	helperCategory = Helpers::CategoryHelper.new
	localCategoies = helperCategory.get_categories
	count = localCategoies.count
	arr  = Array.new(count)
	i = 0
	localCategoies.each_key do |key|
		arr[i] = {type: key, name: localCategoies[key]}
		i+=1
	end
	arr.to_json
end

get '/api/place/:lat/:lng' do

  response= nil

  begin
    client = GooglePlaces::Client.new(GOOGLE_API_KEY)
    puts params[:lng]
    puts params[:lat]
    response = client.spots(params[:lat],params[:lng])
  rescue Exception => e
    headers
    response = {message: e.message }
  end
  arr = Array.new(response.length)
  response.each_index{|i| arr[i] =  spot_to_json(response[i])}
  arr.to_json
end

