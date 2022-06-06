class User
  def initialize(username, password, email, number, first_name, last_name, id = nil)
    @username = username 
    @password = password
    @email = email
    @number = number
    @first_name = first_name
    @last_name = last_name
    @id = id
  end

  def username
    return @username
  end

  def password
    return @password
  end
  
  def email
    return @email
  end

  def number
    return @number
  end
  
  def first_name
    return @first_name
  end

  def last_name
    return @last_name
  end

  def id
    return @id
  end

end
