# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Employee.create([
    {
        idEmployee: "1256",
        fullname: "Carla Gomez",
        occupation: "technical lead",
        idBoss: "1254"
    },
    {
        idEmployee: "1262",
        fullname: "Juan Gonzales",
        occupation: "Developer",
        idBoss: "4566"
    }
])