
User.destroy_all

Farm.destroy_all

User.create!({user_name: 'sam_moss', latitude: 42.878370, longitude: -73.197140, email:'thisis.fryou@gmail.com', user_type: 'admin', password: 'topsecret'})

User.create!({user_name: 'connie_consumer', latitude: 42.878370, longitude: -73.197140, email:'connie@fake.com', user_type: 'consumer', password: 'topsecret'})

sam = User.find_by_user_name('sam_moss')

sam.farms.create({farm_name: 'Sams Farm', latitude: 42.878370, longitude: -73.197140, products: {"produce":["carrots","celery"],"meat":["chicken"]}})

p "Created #{User.count} Users and #{Farm.count} Farms."
