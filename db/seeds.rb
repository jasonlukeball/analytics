# ==========
# admins
# ==========

Admin.create!(name: "Jason Ball", email: "jasonlukeball@me.com", password: "password")
Admin.create!(name: "Test User", email: "user@example.com", password: "password")

admins = Admin.all


# ==========
# apps
# ==========

40.times do
  App.create!( admin: admins.sample, name: Faker::App.name, url: Faker::Internet.url )
end

apps = App.all


# ==========
# events
# ==========

events_array = ['created-todo', 'edited-todo', 'updated-todo', 'deleted-todo']

200.times do
  Event.create!( app: apps.sample, name: events_array.sample )
end

events = Event.all


puts
puts "DB Seed Finished!"
puts "--------------------"
puts "#{Admin.count} admins created"
puts "#{App.count} apps created"
puts "#{Event.count} events created"