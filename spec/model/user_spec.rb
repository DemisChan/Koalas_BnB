require "user"

RSpec.describe User do
  it "constructs without an ID" do
    user = User.new(
      "demis",
      "123demis"
    )
    expect(user.username).to eq "demis"
    expect(user.password).to eq "123demis"
  end

  it "constructs with an ID" do
    user = User.new(
      2,
      "demis",
      "123demis"
    )
    expect(user.id).to eq 2
    expect(user.username).to eq "demis"
    expect(user.password).to eq "123demis"
  end
end
