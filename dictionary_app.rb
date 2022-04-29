require "http"
system "clear"

while true
  print "Enter a word to get a definition, example, and pronunciation. When done, enter 'q': "
  input_word = gets.chomp
  if input_word.downcase == "q"
    break
  else
    response_definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
    word_data = response_definition.parse(:json)
    definition = word_data[1]["text"]

    response_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/topExample?useCanonical=false&api_key=")
    example_data = response_example.parse(:json)
    example = example_data["text"]

    response_pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{input_word}/pronunciations?useCanonical=false&limit=50&api_key=")
    pronunciation_data = response_pronunciation.parse(:json)
    pronunciation = pronunciation_data[0]["raw"]

    puts "Definition: #{definition}"
    puts ""
    puts "Example: #{example}"
    puts ""
    puts "Pronunciation: #{pronunciation}"
  end
end
