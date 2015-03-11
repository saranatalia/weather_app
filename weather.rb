require 'yahoo_weatherman'

def determine_weath(zipcode)
client = Weatherman::Client.new
weather = client.lookup_by_location(zipcode)
text = client.lookup_by_location(zipcode).condition['text']
puts "The temperature is currently #{text.downcase}"

return weather
end 



def do_forecast(weather)
  today = Time.now.strftime("%w").to_i
  tomorrow = today + 1
  if (tomorrow == 7)
    tomorrow = 0
  end 

  weather.forecasts.each do |day|

if (day["day"] == "Mon")
  weekday = 1
  name = "Monday"
elsif (day["day"] == "Tue")
  weekday = 2
  name = "Tuesday"
elsif (day["day"] == "Wed")
  weekday = 3
  name = "Wednesday"
elsif (day["day"] == "Thu")
  weekday = 4
  name = "Thursday"
elsif (day["day"] == "Fri")
  weekday = 5
  name = "Friday"
elsif (day["day"] == "Sat")
  weekday = 6
  name = "Saturday"
else (day["day"] == "Sun")
  weekday = 0
  name = "Sunday"
end 

  if (weekday == today)
   puts "Today's forecast is #{day["text".to_s].downcase} with temperatures between #{day["low"]} and #{day["high"]}."
  elsif (weekday == tomorrow)
    puts "Tomorrow's forecast is #{day["text".to_s].downcase} with temperatures between #{day["low"]} and #{day["high"]}. "
  else 
  puts "#{name}'s forecast is #{day["text"].downcase} with temperatures between #{day["low"]} and #{day["high"]}."
  end
  end 
end


puts "What is your zipcode?"
zipcode = gets.to_s
weather = determine_weath(zipcode)
puts "the five day forecast is:"
do_forecast(weather)

##always remember to set the method(argument) to a VARIABLE so you can USE IT





