# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

roleClient   = UserRole.create(id: 0, name: 'cliente')
roleDriver   = UserRole.create(id: 1, name: 'conductor')
roleOperator = UserRole.create(id: 2, name: 'operador')
roleAdmin    = UserRole.create(id: 3, name: 'administrador')

# Admin 
User.create(active: true,
            email: 'martin@mail.com', 
            name: 'Martin', 
            phone_number: '6666 7777', 
            user_role_id: roleAdmin.id, 
            password: '12345678', password_confirmation: '12345678')

# Operators
User.create(active: true,
            email: 'jorge@mail.com', 
            name: 'Jorge', 
            phone_number: '33 0000 0000', 
            user_role_id: roleOperator.id, 
            password: '12345678', password_confirmation: '12345678')
User.create(active: true,
            email: 'claudia@mail.com', 
            name: 'Claudia', 
            phone_number: '33 0000 0000', 
            user_role_id: roleOperator.id, 
            password: '12345678', password_confirmation: '12345678')

# Client
user = User.create(active: true,
                   email: 'gaston@mail.com', 
                   name: 'Gaston', 
                   phone_number: '8888 8888', 
                   user_role_id: roleClient.id, 
                   password: '12345678', password_confirmation: '12345678')
client = Client.create(    user_id: user.id,
                       location_id: Location.create(latitude: 20.674387, 
                                                    longitude: -103.387315, 
                                                    address: 'calle sin nombre 200').id)

# Drivers
incomunicado = DriverStatus.create(id: 1, name: 'incomunicado')
inactivo = DriverStatus.create(id: 2, name: 'inactivo')
libre = DriverStatus.create(id: 3, name: 'libre')
ocupado = DriverStatus.create(id: 4, name: 'ocupado')

user = User.create(active: true,
                   email: 'picapiedra@mail.com', 
                   name: 'Pedro Picapiedra', 
                   phone_number: '6666 7777', 
                   user_role_id: roleDriver.id, 
                   password: '12345678', password_confirmation: '12345678')
d1 = Driver.create(license: '01020304', cellphone: '33 0000 1111', 
                   tracker_device_id: 
                       TrackerDevice.create(model: 'ABC001').id,
                   driver_status_id: incomunicado.id, user_id: user.id)

user = User.create(active: true,
                   email: 'infante@mail.com', 
                   name: 'Pedro Infante', 
                   phone_number: '6666 7777', 
                   user_role_id: roleDriver.id, 
                   password: '12345678', password_confirmation: '12345678')
d2 = Driver.create(license: '11121314', cellphone: '33 0000 1111', 
                   tracker_device_id: 
                       TrackerDevice.create(model: 'ABC002').id,
                   driver_status_id: inactivo.id, user_id: user.id)

user = User.create(active: true,
                   email: 'navajas@mail.com', 
                   name: 'Pedro Navajas', 
                   phone_number: '6666 7777', 
                   user_role_id: roleDriver.id, 
                   password: '12345678', password_confirmation: '12345678')
d3 = Driver.create(license: '21222324', cellphone: '33 0000 1111', 
                   tracker_device_id: 
                       TrackerDevice.create(model: 'ABC003').id,
                   driver_status_id: libre.id, user_id: user.id)

user = User.create(active: true,
                   email: 'paramo@mail.com', 
                   name: 'Pedro Paramo', 
                   phone_number: '6666 7777', 
                   user_role_id: roleDriver.id, 
                   password: '12345678', password_confirmation: '12345678')
d4 = Driver.create(license: '31323334', cellphone: '33 0000 1111', 
                   tracker_device_id: 
                       TrackerDevice.create(model: 'ABC004').id,
                   driver_status_id: ocupado.id, user_id: user.id)

# Vehicles
roleRegular = VehicleRole.create(id: 0, name: 'taxi');
roleExecutive = VehicleRole.create(id: 1, name: 'taxi ejecutivo');

v1 = Vehicle.create(model: 'Tsuru',  
               plate: 'amj-0000',  
               vehicle_role_id: roleRegular.id,  
               tracker_device_id: 
                   TrackerDevice.create(model: 'TaxiGPS01').id,
               year: 2010)
v2 = Vehicle.create(model: 'Tsuru',  
               plate: 'amj-0001',
               vehicle_role_id: roleRegular.id,  
               tracker_device_id: 
                   TrackerDevice.create(model: 'TaxiGPS02').id,
               year: 2011)
v3 = Vehicle.create(model: 'Sentra',  
               plate: 'amj-0002',
               vehicle_role_id: roleExecutive.id,  
               tracker_device_id: 
                   TrackerDevice.create(model: 'TaxiGPS03').id,
               year: 2012)
v4 = Vehicle.create(model: 'Sentra',  
               plate: 'amj-0003',  
               vehicle_role_id: roleExecutive.id,  
               tracker_device_id: 
                   TrackerDevice.create(model: 'TaxiGPS04').id,
               year: 2012)

# Drivers Vehicles - Log of asignations
DriverVehicleRecord.create(driver_id: d1.user_id,
                           vehicle_id: v1.id,
                           assigned_at: DateTime.new(2009, 06, 06, 12, 00))
DriverVehicleRecord.create(driver_id: d2.user_id,
                           vehicle_id: v2.id,
                           assigned_at: DateTime.new(2009, 06, 06, 12, 00))
DriverVehicleRecord.create(driver_id: d3.user_id,
                           vehicle_id: v3.id,
                           assigned_at: DateTime.new(2009, 06, 06, 12, 00))
DriverVehicleRecord.create(driver_id: d4.user_id,
                           vehicle_id: v4.id,
                           assigned_at: DateTime.new(2009, 06, 06, 12, 00))


# TODO: `block in trace_on': invalid byte sequence in US-ASCII
# For: Eca Do Queirós
TransportService.create(
               #client_id: NULL,
               client_name: 'Enrique',
               #comments
               fare: 50.0,
               driver_id: d1.id,
               schedule_at: DateTime.new(2013, 12, 30, 18, 30),
               tservice_location_orig_id: Location.create(
                   latitude: 20.69138, 
                   longitude: -103.430241, 
                   comments: 'reja blanca, hay un arbol de naranjas',
                   address: 'Eca Do Queiros 5210, Jardines Universidad').id,
               tservice_location_dest_id: Location.create(
                   latitude: 20.69128, 
                   longitude: -103.419641, 
                   address: 'Eca Do Queiros 5067, Jardines Universidad').id)

TransportService.create(
               client_id: client.user_id,
               #client_name: NULL,
               comments: 'Lopez cotilla cerrada por obra',
               fare: 50.0,
               driver_id: d2.id,
               schedule_at: DateTime.new(2015, 10, 01, 10, 00), # mes dia hora
               tservice_location_orig_id: client.location_id, 
               tservice_location_dest_id: Location.create(
                   latitude: 20.658682, 
                   longitude: -103.30261, 
                   address: 'Delgadillo Araujo 158, San Andres').id)

TransportService.create(
               client_id: client.user_id,
               #client_name: NULL,
               comments: 'en la entrada de Liverpool',
               fare: 50.0,
               #driver_id: NULL,
               schedule_at: DateTime.new(2015, 8, 16, 7), # mes dia hora
               tservice_location_orig_id: Location.create(
                   latitude: 20.676766, 
                   longitude: -103.430144
                   #comments
                   #address: NULL
               ).id, 
               tservice_location_dest_id: Location.create(
                   latitude: 20.676736, 
                   longitude: -103.430144 
                   #comments
                   #address: NULL
               ).id)

#EOF
