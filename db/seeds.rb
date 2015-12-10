usernames = ["alice", "bob", "carol"]

usernames.each do |username|
  user = User.create
  user.email = "#{username}@example.com"
  user.password = "12341234"
  user.save
end

puts "There are now #{User.count} users in the database."
