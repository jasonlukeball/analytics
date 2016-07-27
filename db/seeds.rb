# ==========
# admins
# ==========

Admin.create!(name: "Jason Ball", email: "jasonlukeball@me.com", password: "password")
Admin.create!(name: "Test User", email: "user@example.com", password: "password")

admins = Admin.all


# ==========
# apps
# ==========

10.times do
  App.create!( admin: admins.sample, name: Faker::App.name, url: Faker::Internet.url )
end

apps = App.all


# ==========
# users
# ==========

# some events with user, some with app only

100.times do
  User.create!(app: apps.sample, name: Faker::Name.name, email: Faker::Internet.email, last_seen_at: rand(10.days), web_sessions: rand(1..30))
end

users = User.all



# ==========
# events
# ==========

events_array = ['created-todo', 'edited-todo', 'updated-todo', 'deleted-todo']

# user events
400.times do
  Event.create!( app: apps.sample, user: users.sample, name: events_array.sample )
end

# app events
400.times do
  Event.create!( app: apps.sample, name: events_array.sample )
end


events = Event.all


puts
puts "DB Seed Finished!"
puts "--------------------"
puts "#{Admin.count} admins created"
puts "#{App.count} apps created"
puts "#{User.count} users created"
puts "#{Event.count} events created"