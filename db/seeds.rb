User.destroy_all

print "creating user"

u1 = User.create(
    name: 'Angela', 
    email: 'angela@ga.co', 
    password: 'chicken'
)
u2 = User.create(
    name: 'Dan', 
    email: 'dan@ga.co', 
    password: 'chicken'
)
u3 = User.create(
    name: 'Ethan', 
    email: 'ethan@ga.co', 
    password: 'chicken'
)

puts " created #{User.count} users"
# puts " #{User.first.name} has "


################
Airplane.destroy_all
print "creating airplanes"
a1 = Airplane.create(
    name: "ZZY01", 
    total_rows: 10, 
    total_columns: 6
)
a2 = Airplane.create(
    name: "777", 
    total_rows: 20, 
    total_columns: 6
)
a3 = Airplane.create(
    name: "A380", 
    total_rows: 100, 
    total_columns: 8
)

puts " created #{Airplane.count} airplanes "

##################
Flight.destroy_all
print "creating flights"
f1 = Flight.create(
    origin: "SYD", 
    destination: "MEL", 
    date: "2022/05/23", 
    airplane_id: a1.id
)
f2 = Flight.create(
    origin: "SYD", 
    destination: "BNE", 
    date: "2022/03/23", 
    airplane_id: a2.id
)
f3 = Flight.create(
    origin: "SYD", 
    destination: "LHR", 
    date: "2022/03/23", 
    airplane_id: a3.id
)
f4 = Flight.create(
    origin: "SYD", 
    destination: "LHR", 
    date: "2022/03/24", 
    airplane_id: a3.id
)
f5 = Flight.create(
    origin: "SYD", 
    destination: "LHR", 
    date: "2022/03/25", 
    airplane_id: a3.id
)

puts " created #{Flight.count} flights"
# puts "flight #{f1.airplane.name} has "

##############
print "creating reservations"
Reservation.destroy_all
r1 = Reservation.create(
    seat_row: 2,
    seat_column: 5, 
    flight_id: f1.id, 
    user_id: u1.id
)
r2 = Reservation.create(
    seat_row: 2,
    seat_column: 2, 
    flight_id: f2.id, 
    user_id: u2.id
)
r3 = Reservation.create(
    seat_row: 1,
    seat_column: 5, 
    flight_id: f3.id, 
    user_id: u3.id
)
r4 = Reservation.create(
    seat_row: 1,
    seat_column: 7, 
    flight_id: f3.id, 
    user_id: u1.id
)

puts " created #{Reservation.count}"
puts " Reservation #{r1.id} belongs to #{Reservation.first.user.name} "
puts " User #{Reservation.first.user.name} has reservations"


