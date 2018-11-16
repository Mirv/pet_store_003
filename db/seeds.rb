# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    
def makeDefaultUser(number_defaults = 1, first_half_email = "a", email_domain = "test.com")
  # puts "entering makeDefaultUser"

  ### Todo - Extract this to check function & use it to replace later in process so new a, b default code doesn't fight old replacment
  full_email = first_half_email + "@" + email_domain
  if User.find_by(email: full_email)
    full_email = increment_email_address(first_half_email, email_domain, full_email )
  end
  
  # puts "calling makeUserInfo"
  new_user_make = assembleUserInfo(number_defaults)
  new_user_make["email"] = full_email
  puts "Pre new user #{new_user_make["email"]}"
  new_user_made = User.create!(new_user_make)
  print "New user made -- #{new_user_made.name}"
  return new_user_made
  
end

def increment_email_address(address, domain, full_email)
  puts "MDU -- incrementing past #{full_email} -- user already exists"
  until !User.find_by(email: full_email)
    address = address.next 
    email = address + "@" + domain
  end
  return email
end

makeDefaultUser