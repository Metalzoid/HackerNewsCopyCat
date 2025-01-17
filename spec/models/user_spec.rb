require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: "user@test.fr", password: "azerty") }

  it "User not valid without username" do
    expect(subject).to_not be_valid
  end

  it "User valid with username" do
    subject.username = "username"
    expect(subject).to be_valid
    subject.save!
    expect(subject.username).to eq "username"
  end
end
