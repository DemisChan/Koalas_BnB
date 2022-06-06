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
    result = @database.run("INSERT INTO users (username, password) 
    VALUES ($1, $2) RETURNING id;",
    [user.username, user.password])
    return result[0]["id"]
  end

  def remove(index)
    @database.run("DELETE FROM users WHERE id = $1;", [index])
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
      row["password"]
    )
  end
end
