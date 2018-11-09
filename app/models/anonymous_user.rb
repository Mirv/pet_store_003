class AnonymousUser < User
  def id
    0
  end

  def email
    "Anonymous@test.com"
  end
  
  def admin
    false
  end
  
  def anonymous?
    true
  end
end