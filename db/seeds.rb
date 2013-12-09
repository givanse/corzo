# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: 'administrador')
Role.create(name: 'propietario')
Role.create(name: 'operador')
Role.create(name: 'conductor')
Role.create(name: 'cliente')

DriverStatus.create(name: 'incomunicado')
DriverStatus.create(name: 'inactivo')
DriverStatus.create(name: 'libre')
DriverStatus.create(name: 'ocupado')

