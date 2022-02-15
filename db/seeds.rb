User.destroy_all

print "creating user"

u1 = User.create name: 'Angela', email: 'angela@ga.co' , password: 'chicken'

puts "created #{User.count} users"

print "creating flights"

f1 = Flight.create flight_id: 01, origin: "sydney", destination: "melbourne" , date: 15/02/2022

puts "created #{Flight.count} flights"