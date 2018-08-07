# https://github.com/modood/Administrative-divisions-of-China

require 'csv'
require 'json'

require 'byebug'

provinces_source_file = File.join(__dir__, 'Administrative-divisions-of-China/provinces.csv')
provinces = []
CSV.parse(File.read(provinces_source_file), headers: true).each do |province|
  provinces << { text: province['name'], id: "#{province['code']}0000" }
end

cities_source_file = File.join(__dir__, 'Administrative-divisions-of-China/cities.csv')
cities = []
CSV.parse(File.read(cities_source_file), headers: true).each_with_index do |city|
  cities << { text: city['name'], id: "#{city['code']}00" }
end

districts_source_file = File.join(__dir__, 'Administrative-divisions-of-China/areas.csv')
districts = []
CSV.parse(File.read(districts_source_file), headers: true).each do |district|
  districts << { text: district['name'], id: "#{district['code']}" }
end

path = File.join(__dir__, 'areas.json')
content = JSON.pretty_generate(province: provinces, city: cities, district: districts, street: [])
File.write(path, content)
