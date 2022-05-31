$:.unshift File.join(File.dirname(__FILE__), 'lib')
require "database_connection"

# This file sets up the database tables. If you change any of the contents
# of this file, you should rerun `ruby reset_tables.rb` to ensure that your
# database tables are re-created.

def reset_tables(db)
  db.run("DROP TABLE IF EXISTS animals;")
  db.run("CREATE TABLE animals (id SERIAL PRIMARY KEY, species TEXT NOT NULL);")

  db.run("DROP TABLE IF EXISTS lostcats;")
  db.run("CREATE TABLE lostcats (id SERIAL PRIMARY KEY, name TEXT NOT NULL, 
    breed TEXT NOT NULL, tel VARCHAR);")
end

dev_db = DatabaseConnection.new("localhost", "web_application_dev")
reset_tables(dev_db)

test_db = DatabaseConnection.new("localhost", "web_application_test")
reset_tables(test_db)
