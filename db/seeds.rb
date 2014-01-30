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

# Drivers - Pedro
ud1 = User.create(name: 'Pedro Picapiedra', phone_number: '6666 7777', 
                 email: 'picapiedra@mail.com', role_id: driver.id, 
                 password: '12345678', password_confirmation: '12345678')
ud2 = User.create(name: 'Pedro Infante', phone_number: '6666 7777', 
                 email: 'infante@mail.com', role_id: driver.id, 
                 password: '12345678', password_confirmation: '12345678')
ud3 = User.create(name: 'Pedro Navajas', phone_number: '6666 7777', 
                 email: 'navajas@mail.com', role_id: driver.id, 
                 password: '12345678', password_confirmation: '12345678')
ud4 = User.create(name: 'Pedro Paramo', phone_number: '6666 7777', 
                 email: 'paramo@mail.com', role_id: driver.id, 
                 password: '12345678', password_confirmation: '12345678')
# Clients - Miss
User.create(name: 'Miss Piggy', phone_number: '7777 7777', 
            email: 'piggy@mail.com', role_id: client.id, 
            password: '12345678', password_confirmation: '12345678')
User.create(name: 'Miss Poogy', phone_number: '8888 8888', 
            email: 'poogy@mail.com', role_id: client.id, 
            password: '12345678', password_confirmation: '12345678')

d1 = Driver.create(license: '01020304', cellphone: '33 0000 1111', driver_status_id: libre.id, user_id: ud1.id)
d2 = Driver.create(license: '11121314', cellphone: '33 0000 1111', driver_status_id: ocupado.id, user_id: ud2.id)
d3 = Driver.create(license: '21222324', cellphone: '33 0000 1111', driver_status_id: inactivo.id, user_id: ud3.id)
d4 = Driver.create(license: '31323334', cellphone: '33 0000 1111', driver_status_id: libre.id, user_id: ud4.id)


# TODO: `block in trace_on': invalid byte sequence in US-ASCII
# For: Eca Do Queirós
Service.create(address: 'Eca Do Queiros 5210', 
               suburb: 'Jardines Universidad', 
               references: 'reja blanca, hay un arbol de naranjas',
               phone_number: '4444 9999', 
               latitude: 20.69131, longitude: -103.421765, 
               schedule_at: DateTime.new(2013, 12, 30, 18, 30))
Service.create(address: 'Paseo de las Azucenas 318', 
               suburb: 'Prados Tepeyac', 
               references: 'al lado de un Oxxo',
               phone_number: '4444 9999', 
               latitude: 20.655326, longitude: -103.410482, 
               schedule_at: DateTime.new(2013, 11, 15, 15, 30))
Service.create(address: 'Delgadillo Araujo 158', 
               suburb: 'San Andres', 
               references: 'no se ve el numero porque hay enredadera',
               phone_number: '4444 9999', 
               latitude: 20.658682, longitude: -103.30261, 
               schedule_at: DateTime.new(2015, 10, 01, 10, 00))
Service.create(address: '', 
               suburb: '', 
               references: 'Plaza Galerias, en la entrada de Liverpool',
               phone_number: '4444 9999', 
               latitude: 20.676736, longitude: -103.430144, 
               schedule_at: DateTime.new(2015, 8, 16, 7)) # mes, dia, hora

Vehicle.create(plate: 'amj-0000',  model: 'Tsuru',  year: 2010, driver_id: d1.id)
Vehicle.create(plate: 'amj-0001',  model: 'Tsuru',  year: 2012, driver_id: d2.id)
Vehicle.create(plate: 'amj-0002',  model: 'Tsuru',  year: 2012, driver_id: d3.id)
Vehicle.create(plate: 'amj-0003',  model: 'Tsuru',  year: 2013, driver_id: d4.id)

#EOF
