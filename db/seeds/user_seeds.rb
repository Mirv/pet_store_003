# --- default user --- #

def takeInfo(name, email, password)
  new_user_make = User.new do |u|
        u.email = email
        u.password = password
        u.password_confirmation = password
  end
  return new_user_make
end

# --- spare users --- #

#
# get the info and apply any data shaping
#
def assembleUserInfo(u)
  hold = Hash.new
  u = u * 1000
  random = rand(u)

  hold = hold.merge({
    "password" =>  "ssssss",
    "password_confirmation" =>  "ssssss"
  })
  return hold
end


def findDefaultUserEmail(number_defaults = 1, first_half_email = "a", email_domain = "test.com")
  ### Note:  Extract this to check function & use it to replace later in process so new a, b default code doesn't fight old replacment
  email = first_half_email + "@" + email_domain
  if User.find_by(email: email)
    until !User.find_by(email: email)
      first_half_email = first_half_email.next 
      email = first_half_email + "@" + email_domain
    end
  end
  return email
  
end
