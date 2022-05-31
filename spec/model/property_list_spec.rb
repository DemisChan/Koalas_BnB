require "helpers/database_helpers"
require "property"
require "property_list"

RSpec.describe PropertyList do
  def empty_and_return_database
    DatabaseHelpers.clear_table("properties")
    return DatabaseHelpers.test_db_connection
  end

  it "start with an empty table" do
    database = empty_and_return_database
    property_list = PropertyList.new(database)
    expect(property_list.list).to eq []
  end
end
