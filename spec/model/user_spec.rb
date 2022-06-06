require "user"

RSpec.describe User do
  it "constructs without an ID" do
    user = User.new(
      "Demis",
      "123Demis",
      "demis@gmail.com",
      "07123456789",
      "Demis",
      "Lavrentidis"
    )
    expect(user.username).to eq "Demis"
    expect(user.password).to eq "123Demis"
    expect(user.email).to eq "demis@gmail.com"
    expect(user.number).to eq "07123456789"
    expect(user.first_name).to eq "Demis"
    expect(user.last_name).to eq "Lavrentidis"
  end

  it "constructs with an ID" do
    user = User.new(
      "Demis",
      "123Demis",
      "demis@gmail.com",
      "07123456789",
      "Demis",
      "Lavrentidis",
      2
    )

    expect(user.username).to eq "Demis"
    expect(user.password).to eq "123Demis"
    expect(user.email).to eq "demis@gmail.com"
    expect(user.number).to eq "07123456789"
    expect(user.first_name).to eq "Demis"
    expect(user.last_name).to eq "Lavrentidis"
    expect(user.id).to eq 2
  end
end
