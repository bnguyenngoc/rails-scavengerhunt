# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', email: 'admin@lanets.ca', password: 'allo123', password_confirmation: 'allo123', role: 2)
User.create(name: 'judge', email: 'judge@lanets.ca', password: 'allo123', password_confirmation: 'allo123', role: 1)
