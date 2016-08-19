# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all
Product.create! product_id: '0001', name: 'Apple', price: 1, manufacturer: 'Garden #1'
Product.create! product_id: '0002', name: 'Peach', price: 2, manufacturer: 'Garden #2'
Product.create! product_id: '0003', name: 'Pear', price: 2, manufacturer: 'Garden #1'

User.delete_all
User.create! name: 'Test', email: 'test@email.com', password: '123456'
