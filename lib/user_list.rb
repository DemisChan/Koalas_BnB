class UserList
  def initialize(database)
    @database = database
  end

  def list
    return @database.run("SELECT * FROM users ORDER BY id;").map do |row|
      row_to_object(row)
    end
  end

  def add(user)
    result = @database.run("INSERT INTO users (username, password, email, number,
    first_name, last_name) 
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id;",
    [user.username, user.password, user.email, user.number, 
    user.first_name, user.last_name])
    return result[0]["id"]
  end

  def remove(index)
    @database.run("DELETE FROM users WHERE id = $1;", [index])
  end

  def update(index, username, password, email, number, 
    first_name, last_name)
    @database.run("UPDATE users
    SET username = $2, password = $3, email = $4, number = $5, first_name =$6, last_name = $7
    WHERE id = $1;",
    [index, username, password, email, number, first_name, last_name])
  end

  def get(index)
    result = @database.run("SELECT * FROM users WHERE id = $1;", [index])
    return row_to_object(result[0])
  end
  def update(index, username, password)
    @database.run("UPDATE users SET username = $2, password = $3 WHERE id = $1;",
    [index, username, password])
  end

	def get(index)
		result = @database.run("SELECT * FROM users WHERE id = $1;", [index])
		return row_to_object(result[0])
	end

  private

  def row_to_object(row)
    return User.new(
      row["id"],
      row["username"],
      row["password"],
      row["email"],
      row["number"],
      row["first_name"],
      row["last_name"]
    )
  end
end
