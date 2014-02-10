# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Owner
roleOwner = Role.create(name: 'propietario')
User.create(active: true,
            email: 'luke@mail.com', 
            name: 'Luke Skywalker', 
            phone_number: '6666 7777', 
            role_id: roleOwner.id, 
            #tracker_device_id: NULL, 
            password: '12345678', password_confirmation: '12345678')

# Operators
roleOperator = Role.create(name: 'operador')
User.create(active: true,
            email: 'jorge@mail.com', 
            name: 'Jorge', 
            phone_number: '33 0000 0000', 
            role_id: roleOperator.id, 
            #tracker_device_id: NULL, 
            password: '12345678', password_confirmation: '12345678')
User.create(active: true,
            email: 'claudia@mail.com', 
            name: 'Claudia', 
            phone_number: '33 0000 0000', 
            role_id: roleOperator.id, 
            #tracker_device_id: NULL, 
            password: '12345678', password_confirmation: '12345678')

# Clients
roleClient = Role.create(name: 'cliente')
tslMinerva = TransportServiceLocation.create(latitude: 20.674387, 
                                      longitude: -103.387315, 
                                      address: 'calle sin nombre 200')
user = User.create(active: true,
                   email: 'piggy@mail.com', 
                   name: 'Miss Piggy', 
                   phone_number: '7777 7777', 
                   role_id: roleClient.id, 
                   #tracker_device_id: NULL, 
                   password: '12345678', password_confirmation: '12345678')
clientPiggy = Client.create(tservice_location_orig_id: tslMinerva.id, 
                            user_id: user.id)
user = User.create(active: true,
                   email: 'poogy@mail.com', 
                   name: 'Miss Poogy', 
                   phone_number: '8888 8888', 
                   role_id: roleClient.id, 
                   #tracker_device_id: NULL, 
                   password: '12345678', password_confirmation: '12345678')
clientPoogy = Client.create(tservice_location_orig_id: tslMinerva.id, 
                            user_id: user.id)

# Drivers
roleDriver = Role.create(name: 'conductor')

incomunicado = DriverStatus.create(id: 0, name: 'incomunicado')
inactivo = DriverStatus.create(id: 1, name: 'inactivo')
libre = DriverStatus.create(id: 2, name: 'libre')
ocupado = DriverStatus.create(id: 3, name: 'ocupado')

user = User.create(active: true,
                   email: 'picapiedra@mail.com', 
                   name: 'Pedro Picapiedra', 
                   phone_number: '6666 7777', 
                   role_id: roleDriver.id, 
                   tracker_device_id: 
                       TrackerDevice.create(description: 'ABC001').id,
                   password: '12345678', password_confirmation: '12345678')
d1 = Driver.create(license: '01020304', cellphone: '33 0000 1111', 
                   driver_status_id: incomunicado.id, user_id: user.id)

user = User.create(active: true,
                   email: 'infante@mail.com', 
                   name: 'Pedro Infante', 
                   phone_number: '6666 7777', 
                   role_id: roleDriver.id, 
                   tracker_device_id: 
                       TrackerDevice.create(description: 'ABC002').id,
                   password: '12345678', password_confirmation: '12345678')
d2 = Driver.create(license: '11121314', cellphone: '33 0000 1111', 
                   driver_status_id: inactivo.id, user_id: user.id)

user = User.create(active: true,
                   email: 'navajas@mail.com', 
                   name: 'Pedro Navajas', 
                   phone_number: '6666 7777', 
                   role_id: roleDriver.id, 
                   tracker_device_id: 
                       TrackerDevice.create(description: 'ABC003').id,
                   password: '12345678', password_confirmation: '12345678')
d3 = Driver.create(license: '21222324', cellphone: '33 0000 1111', 
                   driver_status_id: libre.id, user_id: user.id)

user = User.create(active: true,
                   email: 'paramo@mail.com', 
                   name: 'Pedro Paramo', 
                   phone_number: '6666 7777', 
                   role_id: roleDriver.id, 
                   tracker_device_id: 
                       TrackerDevice.create(description: 'ABC004').id,
                   password: '12345678', password_confirmation: '12345678')
d4 = Driver.create(license: '31323334', cellphone: '33 0000 1111', 
                   driver_status_id: ocupado.id, user_id: user.id)

# Vehicles
v1 = Vehicle.create(model: 'Tsuru',  
               plate: 'amj-0000',  
               tracker_device_id: 
                   TrackerDevice.create(description: 'TaxiGPS01').id,
               year: 2010)
v2 = Vehicle.create(model: 'Tsuru',  
               plate: 'amj-0001',  
               tracker_device_id: 
                   TrackerDevice.create(description: 'TaxiGPS02').id,
               year: 2011)
v3 = Vehicle.create(model: 'Sentra',  
               plate: 'amj-0002',
               tracker_device_id: 
                   TrackerDevice.create(description: 'TaxiGPS03').id,
               year: 2012)
v4 = Vehicle.create(model: 'Sentra',  
               plate: 'amj-0003',  
               tracker_device_id: 
                   TrackerDevice.create(description: 'TaxiGPS04').id,
               year: 2012)

# Drivers Vehicles
DriversVehicle.create(driver_id: d1.user_id,
                      vehicle_id: v1.id,
                      assigned_at: DateTime.new(2009, 06, 06, 12, 00))
DriversVehicle.create(driver_id: d2.user_id,
                      vehicle_id: v2.id,
                      assigned_at: DateTime.new(2009, 06, 06, 12, 00))
DriversVehicle.create(driver_id: d3.user_id,
                      vehicle_id: v3.id,
                      assigned_at: DateTime.new(2009, 06, 06, 12, 00))
DriversVehicle.create(driver_id: d4.user_id,
                      vehicle_id: v4.id,
                      assigned_at: DateTime.new(2009, 06, 06, 12, 00))


# TODO: `block in trace_on': invalid byte sequence in US-ASCII
# For: Eca Do Queirós
TransportService.create(#client_id: NULL,
               client_name: 'Martin Fierro',
               comments: 'reja blanca, hay un arbol de naranjas',
               fare: 50.0,
               driver_id: 1,
               schedule_at: DateTime.new(2013, 12, 30, 18, 30),
               tservice_location_orig_id: TransportServiceLocation.create(
                   latitude: 20.69138, 
                   longitude: -103.430241, 
                   address: 'Eca Do Queiros 5210, Jardines Universidad').id,
               tservice_location_dest_id: TransportServiceLocation.create(
                   latitude: 20.69128, 
                   longitude: -103.419641, 
                   address: 'Eca Do Queiros 5067, Jardines Universidad').id)

TransportService.create(client_id: clientPiggy.user_id,
               #client_name: NULL,
               comments: 'no se ve el numero porque hay enredadera',
               fare: 50.0,
               #driver_id: NULL,
               schedule_at: DateTime.new(2015, 10, 01, 10, 00), # mes dia hora
               #tservice_location_orig_id: NULL, 
               tservice_location_dest_id: TransportServiceLocation.create(
                   latitude: 20.658682, 
                   longitude: -103.30261, 
                   address: 'Delgadillo Araujo 158, San Andres').id)

TransportService.create(client_id: clientPoogy.user_id,
               #client_name: NULL,
               comments: 'Plaza Galerias, en la entrada de Liverpool',
               fare: 50.0,
               #driver_id: NULL,
               schedule_at: DateTime.new(2015, 8, 16, 7), # mes dia hora
               #tservice_location_orig_id: NULL, 
               tservice_location_dest_id: TransportServiceLocation.create(
                   latitude: 20.676736, 
                   longitude: -103.430144, 
                   #address: NULL
               ).id)

# Daily Logs 
DailyLog.create(tracker_device_id: 1, date: Date.new(2000, 1, 20))
DailyLog.create(tracker_device_id: 1, date: Date.new(2000, 1, 21))
DailyLog.create(tracker_device_id: 2, date: Date.new(2000, 1, 20))
DailyLog.create(tracker_device_id: 2, date: Date.new(2000, 1, 21))

# Position Records

#EOF
