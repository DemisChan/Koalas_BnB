require "helpers/database_helpers"
require "user"
require "user_list"

RSpec.describe UserList do
  def empty_and_return_users
    DatabaseHelpers.clear_table("users")
    return DatabaseHelpers.test_db_connection
  end

  it "starts with an empty table" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)
    expect(user_list.list).to eq []
  end

  it "adds and returns users" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)
    
    user_list.add(User.new(
      "Demis",
      "123Demis"
    ))

    user = user_list.list
    expect(user.length).to eq 1
    expect(user[0].username).to eq "Demis"
    expect(user[0].password).to eq "123Demis"
  end

  it "removes the user" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)

    demis = user_list.add(User.new(
      "Demis",
      "123Demis")
    )

    ana = user_list.add(User.new(
      "Ana",
      "123Ana")
    )

    emma = user_list.add(User.new( 
      "Emma",
      "123Emma")
    )

    user_list.remove(ana)

    users = user_list.list
    expect(users.length).to eq 2
    expect(users[0].username).to eq "Demis"
    expect(users[0].password).to eq "123Demis"
    expect(users[1].username).to eq "Emma"
    expect(users[1].password).to eq "123Emma"


  end


  it "updates user credentials" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)

    demis = user_list.add(User.new(
      "Demis",
      "123Demis")
    )

    ana = user_list.add(User.new(
      "Ana",
      "123Ana")
    )

    user_list.update(ana, 
      "Emma",
      "123Emma"
    )

    users = user_list.list
    expect(users[1].username).to eq "Emma"
    expect(users[1].password).to eq "123Emma"
    expect(users[0].username).to eq "Demis"
    expect(users[0].password).to eq "123Demis"
  end

  it "gets a single user" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)
		
		demis = user_list.add(User.new(
      "Demis",
      "123Demis")
    )

    ana = user_list.add(User.new(
      "Ana",
      "123Ana")
    )		

		users = user_list.get(ana)
		expect(users.username).to eq "Ana"
	end
end
