# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


DriverStatus.create(name: 'incomunicado')
DriverStatus.create(name: 'inactivo')
DriverStatus.create(name: 'libre')
DriverStatus.create(name: 'ocupado')

User.create(name: 'Gaston Silva', phone_number: '6666 7777', email: 'gaston@mail.com', role_id: 1, password: '12345678', password_confirmation: '12345678')

Driver.create(license: '01020304', cellphone: '33 0000 1111', driver_status_id: 3, user_id: 1)

Role.create(name: 'administrador')
Role.create(name: 'propietario')
Role.create(name: 'operador')
Role.create(name: 'conductor')
Role.create(name: 'cliente')

# TODO: `block in trace_on': invalid byte sequence in US-ASCII
# For: Eca Do Queirós
Service.create(address: 'Eca Do Queiros 5210', suburb: 'Jardines Universidad', phone_number: 44449999, latitude: 20.69131, longitude: -103.421765, schedule_at: DateTime.new(2013, 12, 30, 18, 30))

Vehicle.create(plate: 'amj-0000',  model: 'Tsuru',  year: 2010, driver_id: 1)
