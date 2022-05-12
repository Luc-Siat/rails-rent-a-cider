# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.first
# curl https://www.calyce-cidre.com/wp-content/uploads/2020/10/Bordelet-500x500.jpg > imgcidre1.jpg
# image1 = Cloudinary::Uploader.upload("cidre1.jpg")
# cider1 = Cider.create(user: user, name: "Opalyne", region: "Brittany",
# flavor: "Bittersweet, sour & fruity", price: 4 , alcohol_level: 5 , photo: image1)
user = User.first.id

file = URI.open('https://www.calyce-cidre.com/wp-content/uploads/2020/10/Bordelet-500x500.jpg')
cider1 = Cider.create(user_id: user, name: "Opalyne", region: "Brittany", flavor: "Bittersweet, sour & fruity", price: 4,
  alcohol_level: 5)
cider1.photo.attach(io: file, filename: 'cider1', content_type: 'image/png')

file = URI.open('https://www.calyce-cidre.com/wp-content/uploads/2019/11/168A7066-1.jpg')
cider2 = Cider.create(user_id: user, name: "Gast", region: "Brittany", flavor: "Fruity, tannic ", price: 5,
  alcohol_level: 5)
cider2.photo.attach(io: file, filename: 'cider2', content_type: 'image/png')

file = URI.open('https://www.calyce-cidre.com/wp-content/uploads/2020/11/Kystin-XVII-75cl-Petit-1.jpg')
cider3 = Cider.create(user_id: user, name: "Cuvée XVII", region: "Brittany", flavor: "Acidulated, bittersweet and chestnut", price: 12,
  alcohol_level: 4)
cider3.photo.attach(io: file, filename: 'cider3', content_type: 'image/png')

file = URI.open('https://www.calyce-cidre.com/wp-content/uploads/2021/06/Boire-du-Cidre-En-Terrasse-20-1.jpg')
cider4 = Cider.create(user_id: user, name: "Widr", region: "Normandy", flavor: "Tanic, fruity", price: 21,
  alcohol_level: 9)
cider4.photo.attach(io: file, filename: 'cider4', content_type: 'image/png')

file = URI.open('https://www.calyce-cidre.com/wp-content/uploads/2021/06/Boire-du-Cidre-En-Terrasse-20-1.jpg')
cider5 = Cider.create(user_id: user, name: "This Sider Up", region: "Normandy", flavor: "Mineral, fruity", price: 16,
  alcohol_level: 5)
cider5.photo.attach(io: file, filename: 'cider5', content_type: 'image/png')
