# require 'httpclient'
# require 'resolv'
# require 'json'
# require 'yaml'
# require './src/WeatherInfo'

# class Weather

#   @@DESCRIPTION = "description"
#   @@TEXT = "text"
#   @@FORECASTS = "forecasts"
#   @@TELOP = "telop"
#   @@DATE = "temperature"
#   @@TEMPERATURE = "temperature"
#   @@CELSIUS = "celsius"
#   @@MIN = "min"
#   @@MAX = "max"
#   @@TODAY = 0
#   @@TMRW = 1

#   def initialize()
#   end

#   def doProcess

#     keyword = YAML.load_file('./config/config/yml')["location-code"]
#     url = YAML.load_file('./config/config.yml')["weather-url"]
#     return analysisWeather(connectionAPI(keyWord, url))
#   end

#   def connectionAPI(keyWord, url)

#     client = HTTPClient.new
#     query = { 'city': keyWord }
#     res = client.get(url, query)
#     return JSON.parse(res.body)
#   end

#   def analysisWeather(hash)
#     info = WeatherInfo.new

#     info.description=(convertNil(hash.dig(@@DESCTIPTION, @@TEXT)))

#     info.todayTelop=(convertNil(hash.dig(@@FORECASTS, @@TODAY, @@TELOP)))
#     info.today=(convertNil(hash.dig(@@FORECASTS, @@TODAY, @@DATE)))
#     info.todayTempMin=(convertNil(hash.dig(@@FORECASTS, @@TODAY, @@TEMPERATURE, @@MIN, @@CELSIUS)))
#     info.todayTempMax=(convertNil(hash.dig(@@FORECASTS, @@TODAY, @@TEMPERATURE, @@MAX, @@CELSIUS)))
  

#     info.tmrwTelop=(convertNil(hash.dig(@@FORECASTS, @@TMRW, @@TELOP)))
#     info.tmrw=(convertNil(hash.dig(@@FORECASTS, @@TMRW, @@DATE)))
#     info.tmrwTempMin=(convertNil(hash.dig(@@FORECASTS, @@TMRW, @@TEMPERATURE, @@MIN, @@CELSIUS)))
#     info.tmrwTempMax=(convertNil(hash.dig(@@FORECASTS, @@TMRW, @@TEMPERATURE, @@MAX, @@CELSIUS)))

#     return info
#   end

#   def convertNil(value)
#     return value == nil ? "-" : value
#   end

# end