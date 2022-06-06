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
      "123Demis",
      "demis@gmail.com",
      "07123456789",
      "Demis",
      "Lavrentidis"
    ))

    user = user_list.list
    expect(user.length).to eq 1
    expect(user[0].username).to eq "Demis"
    expect(user[0].password).to eq "123Demis"

    expect(user[0].email).to eq "demis@gmail.com"
    expect(user[0].number).to eq "07123456789"
    expect(user[0].first_name).to eq "Demis"
    expect(user[0].last_name).to eq "Lavrentidis"

  end

  it "removes the user" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)

    demis = user_list.add(User.new(
      "Demis",
      "123Demis",
      "demis@gmail.com",
      "07123456789",
      "Demis",
      "Lavrentidis"
    ))

    ana = user_list.add(User.new(
      "Ana",
      "123Ana",
      "ana@gmail.com",
      "07987654321",
      "Ana",
      "Anton"
    ))

    emma = user_list.add(User.new( 
      "Emma",
      "123Emma",
      "emma@gmail.com",
      "07123654789",
      "Emma",
      "Samuel"
    ))

    user_list.remove(ana)

    users = user_list.list
    expect(users.length).to eq 2
    expect(users[0].username).to eq "Demis"
    expect(users[0].password).to eq "123Demis"
    expect(users[0].email).to eq "demis@gmail.com"
    expect(users[0].number).to eq "07123456789"
    expect(users[0].first_name).to eq "Demis"
    expect(users[0].last_name).to eq "Lavrentidis"
    expect(users[1].username).to eq "Emma"
    expect(users[1].password).to eq "123Emma"
    expect(users[1].email).to eq "emma@gmail.com"
    expect(users[1].number).to eq "07123654789"
    expect(users[1].first_name).to eq "Emma"
    expect(users[1].last_name).to eq "Samuel"
  end

  it "updates user credentials" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)

    demis = user_list.add(User.new(
      "Demis",
      "123Demis",
      "demis@gmail.com",
      "07123456789",
      "Demis",
      "Lavrentidis"
    ))

    ana = user_list.add(User.new(
      "Ana",
      "123Ana",
      "ana@gmail.com",
      "07987654321",
      "Ana",
      "Anton")
    )

    emma = user_list.add(User.new( 
      "Emma",
      "123Emma",
      "emma@gmail.com",
      "07123654789",
      "Emma",
      "Meaden")
    )

    user_list.update(emma, 
      "Emma",
      "123Emma",
      "emma@gmail.com",
      "07123654789",
      "Emma",
      "Samuel"
    )

    users = user_list.list
    expect(users[0].username).to eq "Demis"
    expect(users[0].password).to eq "123Demis"
    expect(users[0].email).to eq "demis@gmail.com"
    expect(users[0].number).to eq "07123456789"
    expect(users[0].first_name).to eq "Demis"
    expect(users[0].last_name).to eq "Lavrentidis"

    expect(users[1].username).to eq "Ana"
    expect(users[1].password).to eq "123Ana"
    expect(users[1].email).to eq "ana@gmail.com"
    expect(users[1].number).to eq "07987654321"
    expect(users[1].first_name).to eq "Ana"
    expect(users[1].last_name).to eq "Anton"

    expect(users[2].username).to eq "Emma"
    expect(users[2].password).to eq "123Emma"
    expect(users[2].email).to eq "emma@gmail.com"
    expect(users[2].number).to eq "07123654789"
    expect(users[2].first_name).to eq "Emma"
    expect(users[2].last_name).to eq "Samuel"
  end

  it "gets a single user" do
    users_database = empty_and_return_users
    user_list = UserList.new(users_database)
		
    demis = user_list.add(User.new(
      "Demis",
      "123Demis",
      "demis@gmail.com",
      "07123456789",
      "Demis",
      "Lavrentidis"
    ))

    ana = user_list.add(User.new(
      "Ana",
      "123Ana",
      "ana@gmail.com",
      "07987654321",
      "Ana",
      "Anton")
    )

    users = user_list.get(ana)
    expect(users.username).to eq "Ana"
  end
end
