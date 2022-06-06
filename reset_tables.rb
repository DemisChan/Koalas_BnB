$:.unshift File.join(File.dirname(__FILE__), 'lib')
require "database_connection"

# This file sets up the database tables. If you change any of the contents
# of this file, you should rerun `ruby reset_tables.rb` to ensure that your
# database tables are re-created.

def reset_prop_table(prop_db)

  prop_db.run("DROP TABLE IF EXISTS properties;")
  prop_db.run("CREATE TABLE properties 
    (id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    address TEXT NOT NULL,
    price INTEGER NOT NULL,
    description TEXT NOT NULL);"
  )
end

  # DATE format is YYYY-MM-DD, see https://www.w3schools.com/sql/sql_datatypes.asp for reference
def reset_book_table(book_db)

  book_db.run("DROP TABLE IF EXISTS bookings;")
  book_db.run("CREATE TABLE bookings
    (id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    property_id TEXT NOT NULL);"
  )

end

def reset_user_table(users_db)

  users_db.run("DROP TABLE IF EXISTS users;")
  users_db.run("CREATE TABLE users 
    (id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    email TEXT NOT NULL,
    number TEXT NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL);"
  )
end

dev_db = DatabaseConnection.new("localhost", "web_application_dev")
reset_prop_table(dev_db)

test_db = DatabaseConnection.new("localhost", "web_application_test")
reset_prop_table(test_db)

dev_db = DatabaseConnection.new("localhost", "web_application_dev")
reset_book_table(dev_db)

test_db = DatabaseConnection.new("localhost", "web_application_test")
reset_book_table(test_db)

dev_db = DatabaseConnection.new("localhost", "web_application_dev")
reset_user_table(dev_db)

test_db = DatabaseConnection.new("localhost", "web_application_test")
reset_user_table(test_db)
