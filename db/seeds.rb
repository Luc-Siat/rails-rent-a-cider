# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cider = Cider.new(name: "Strongbow", region: "ireland", flavor: "flavor", alcohol_level: "7", price: "4")
if cider.save
  puts "saved"
else
  puts "nope"
end
