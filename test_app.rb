require "http"
system "clear"

while true
  print "Enter a year from 2013-2019. When finished, type 'q': "
  input_year = gets.chomp
  input_as_integer = input_year.to_i

  if input_year.downcase == "q"
    break
  elsif input_as_integer.between?(2013, 2019)
    if input_as_integer == 2019
      index = 0
    elsif input_as_integer == 2018
      index = 1
    elsif input_as_integer == 2017
      index = 2
    elsif input_as_integer == 2016
      index = 3
    elsif input_as_integer == 2015
      index = 4
    elsif input_as_integer == 2014
      index = 5
    elsif input_as_integer == 2013
      index = 6
    end
    response = HTTP.get("https://datausa.io/api/data?drilldowns=Nation&measures=Population")
    population_data = response.parse(:json)

    index_by_input = population_data["data"][index]
    population_by_index = index_by_input["Population"]
    puts "The United States population in the year #{input_year} was #{population_by_index}."
    puts
  elsif input_as_integer.between?(2013, 2019) == false
    puts "Invalid year"
  end
end
