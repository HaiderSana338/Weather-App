require 'sinatra'
require 'httparty'
require 'json'

API_KEY = '62a28ffed03d06393fb6c2482ddc7ca7' # Replace with your OpenWeatherMap API key

get '/' do
  erb :index
end

get '/map' do
  erb :map
end

post '/weather' do
  city = params[:city]
  @weather_data = fetch_weather_by_city(city)
  erb :weather
end

get '/weather' do
  city = params[:city]
  @weather_data = fetch_weather_by_city(city)
  erb :weather
end

get '/weather-by-coordinates' do
  lat = params[:lat]
  lng = params[:lng]
  @weather_data = fetch_weather_by_coordinates(lat, lng)
  erb :weather
end

def fetch_weather_by_city(city)
  response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=#{city}&appid=#{API_KEY}&units=metric")
  JSON.parse(response.body)
end

def fetch_weather_by_coordinates(lat, lng)
  response = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?lat=#{lat}&lon=#{lng}&appid=#{API_KEY}&units=metric")
  JSON.parse(response.body)
end


  


