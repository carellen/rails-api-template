# README

1. Clone repo:
```
git clone https://github.com/carellen/rails-api-template.git
```
2. Prepare database:
```
rails db: create db:migrate db:seed
```
3. Run server:
```
rails s
```
4. Show api description (doesn't work properly, heh):
```
http://api.lvh.me:3000/apidoc
```
5. Get product list:
```
GET http://api.lvh.me:3000/products
```
6. Show cart:
```
GET http://api.lvh.me:3000/cart
```
7. Add product to cart:
```
POST http://api.lvh.me:3000/cart
body: { product_id: 1, quantity: 2 }
```
8. Remove product:
```
DELETE http://api.lvh.me:3000/cart/1
```