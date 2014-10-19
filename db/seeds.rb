Product.destroy_all

Product.create!([{
  name: "Maven of Moxie Dress",
  price: 139.99,
  size: nil,
  color: "Green"
},
{
  name: "Head of the Room Dress",
  price: 44.99,
  size:  nil,
  color: "Peach"
},
{
  name: "Perfect Pour Dress",
  price: 59.99,
  size: nil,
  color: "Brown"
}])

p "Created #{Product.count} products"
