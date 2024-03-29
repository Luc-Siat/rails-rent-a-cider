

# user = User.first
# curl https://www.calyce-cidre.com/wp-content/uploads/2020/10/Bordelet-500x500.jpg > imgcidre1.jpg
# image1 = Cloudinary::Uploader.upload("cidre1.jpg")
# cider1 = Cider.create(user: user, name: "Opalyne", region: "Brittany",
# flavor: "Bittersweet, sour & fruity", price: 4 , alcohol_level: 5 , photo: image1)

Reservation.destroy_all
Review.destroy_all
Cider.destroy_all

user = User.first.id
user2 = User.last.id


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

reservation1 = Reservation.create(cider_id: cider1.id, user_id: user, date: Date.today, active: false)

review1 = Review.create(content: "what an amazing cider, I definitely recommend that you try it",
  cider_id: cider1.id, user_id: user, rating: 5 )

reservation2 = Reservation.create(cider_id: cider3.id, user_id: user2, date: Date.today, active: false)

review2 = Review.create(content: "it was a bit dry, but still a good cider",
  cider_id: cider3.id, user_id: user2, rating: 4)
