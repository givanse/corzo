# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

incomunicado = DriverStatus.create(name: 'incomunicado')
inactivo = DriverStatus.create(name: 'inactivo')
libre = DriverStatus.create(name: 'libre')
ocupado = DriverStatus.create(name: 'ocupado')

admin = Role.create(name: 'administrador')
owner = Role.create(name: 'propietario')
op = Role.create(name: 'operador')
driver = Role.create(name: 'conductor')
client = Role.create(name: 'cliente')

ua = User.create(name: 'Luke Skywalker', phone_number: '6666 7777', 
                 email: 'luke@mail.com', role_id: admin.id, 
                 password: '12345678', password_confirmation: '12345678')
uo = User.create(name: 'Buzz Lighyear', phone_number: '6666 7777', 
                 email: 'buzz@mail.com', role_id: owner.id, 
                 password: '12345678', password_confirmation: '12345678')
uop = User.create(name: 'Bruno Diaz', phone_number: '6666 7777', 
                 email: 'bruno@mail.com', role_id: op.id, 
                 password: '12345678', password_confirmation: '12345678')
ud1 = User.create(name: 'Peter Parker', phone_number: '6666 7777', 
                 email: 'peter@mail.com', role_id: driver.id, 
                 password: '12345678', password_confirmation: '12345678')
ud2 = User.create(name: 'Tony Stark', phone_number: '6666 7777', 
                 email: 'tony@mail.com', role_id: driver.id, 
                 password: '12345678', password_confirmation: '12345678')
ud3 = User.create(name: 'Kermit Frog', phone_number: '6666 7777', 
                 email: 'kermit@mail.com', role_id: driver.id, 
                 password: '12345678', password_confirmation: '12345678')
uc = User.create(name: 'Miss Piggy', phone_number: '6666 7777', 
                 email: 'piggy@mail.com', role_id: client.id, 
                 password: '12345678', password_confirmation: '12345678')

d1 = Driver.create(license: '01020304', cellphone: '33 0000 1111', driver_status_id: libre.id, user_id: ud1.id)
d2 = Driver.create(license: '11121314', cellphone: '33 0000 1111', driver_status_id: ocupado.id, user_id: ud2.id)
d3 = Driver.create(license: '21222324', cellphone: '33 0000 1111', driver_status_id: inactivo.id, user_id: ud3.id)


# TODO: `block in trace_on': invalid byte sequence in US-ASCII
# For: Eca Do Queirós
Service.create(address: 'Eca Do Queiros 5210', 
               suburb: 'Jardines Universidad', 
               phone_number: '4444 9999', 
               latitude: 20.69131, longitude: -103.421765, 
               schedule_at: DateTime.new(2013, 12, 30, 18, 30))
Service.create(address: 'Paseo de las Azucenas 318', 
               suburb: 'Prados Tepeyac', phone_number: '4444 9999', 
               latitude: 20.655326, longitude: -103.410482, 
               schedule_at: DateTime.new(2013, 11, 15, 15, 30))
Service.create(address: 'Delgadillo Araujo 158', 
               suburb: 'San Andres', phone_number: '4444 9999', 
               latitude: 20.658682, longitude: -103.30261, 
               schedule_at: DateTime.new(2013, 10, 01, 10, 00))

Vehicle.create(plate: 'amj-0000',  model: 'Tsuru',  year: 2010, driver_id: d1.id)
Vehicle.create(plate: 'amj-0001',  model: 'Tsuru',  year: 2012, driver_id: d2.id)
Vehicle.create(plate: 'amj-0002',  model: 'Tsuru',  year: 2012, driver_id: d3.id)
