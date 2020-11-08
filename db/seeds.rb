# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#create slots
Doctor.create(name: "Doctor-1")
Doctor.create(name: "Doctor-2")
Doctor.create(name: "Doctor-3")

Slot.create(name: "Slot-A", start_time: "10 AM")
Slot.create(name: "Slot-B", start_time: "12 PM")
Slot.create(name: "Slot-C", start_time: "2 PM")
Slot.create(name: "Slot-D", start_time: "4 PM")
Slot.create(name: "Slot-E", start_time: "6 PM")