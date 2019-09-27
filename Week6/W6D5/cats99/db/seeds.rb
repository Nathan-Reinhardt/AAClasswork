# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

Cat.destroy_all

cat1 = Cat.create!(birth_date: Date.new(2012,1,1), color: 'green', name: 'Alta', sex: 'M', description: 'Fond memeories with Alta include letting him out of the kitchen every hour and watching him sit and stare.')
cat2 = Cat.create!(birth_date: Date.new(2018,3,15), color: 'purple', name: 'Pumpkin', sex: 'F', description: 'No memories.')
cat3 = Cat.create!(birth_date: Date.new(2011,10,1), color: 'red', name: 'Sylvester', sex: 'M', description: 'Watching him play.')
