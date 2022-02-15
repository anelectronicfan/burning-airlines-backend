User.destroy_all

print "creating user"

u1 = User.create name: 'Angela', email: 'angela@ga.co' , password: 'chicken'

puts " created #{User.count} users"
puts " #{User.first.name} has "


################
Airplane.destroy_all
print "creating airplanes"
a1 = Airplane.create name: "ZZY01", total_rows: 6 , total_columns: 10

puts " created #{Airplane.count} airplanes "

##################
Flight.destroy_all
print "creating flights"
f1 = Flight.create origin: "sydney", destination: "melbourne", date: "2022/05/23", airplane_id: a1.id
puts " created #{Flight.count} flights"
puts "flight #{f1.airplane.name} has "

##############
print "creating reservations"
Reservation.destroy_all
r1 = Reservation.create(
    seat_row: 2,
    seat_column: 5, 
    flight_id: f1.id, 
    user_id: u1.id
)

puts " created #{Reservation.count}"
puts " Reservation #{r1.id} belongs to #{Reservation.first.user.name} "


