class User
  def initialize(id = nil, username, password)
    @id = id
    @username = username 
    @password = password
  end

  def username
    return @username
  end

  def password
    return @password
  end

  def id
    return @id
  end
end