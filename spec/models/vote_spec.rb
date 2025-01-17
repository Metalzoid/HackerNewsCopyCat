require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user) { User.create!(email: "test@test.fr", password: "azerty", username: "username test") }
  let(:post) { Post.create!(title: "Amazing post", post_type: "story", url: "http://test.fr", author: "Author", score: 222) }
  subject { Vote.new(user: user, interactable: post) }

  it "Vote valid with all arguments" do
    expect(subject).to be_valid
  end

  it "Vote not valid without user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "Vote not valid without post" do
    subject.interactable = nil
    expect(subject).to_not be_valid
  end

  it "Can't multiple vote for same post" do
    subject.save!
    second_vote = Vote.new(user: user, interactable: post)
    expect(second_vote).to_not be_valid
  end
end
