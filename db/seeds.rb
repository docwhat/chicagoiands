# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["welcome", "about", "contact", "links"].each do |label|
  Texture.create(label: label, body: "# #{label.capitalize}\n") unless Texture.find_by_label(label)
end
