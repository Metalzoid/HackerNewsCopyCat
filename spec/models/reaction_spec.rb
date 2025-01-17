require 'rails_helper'

RSpec.describe Reaction, type: :model do
  let(:user) { User.create!(email: "test@test.fr", password: "azerty", username: "username test") }
  let(:post) { Post.create!(title: "Amazing post", post_type: "story", url: "http://test.fr", author: "Author", score: 222) }
  let(:comment) { Comment.create!(content: "Nice post !", user: user, interactable: post) }
  subject { Reaction.new(content: "😃", user: user, interactable: comment) }

  it "Reaction valid with all arguments" do
    expect(subject).to be_valid
  end

  it "Reaction not valid without content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "Reaction not valid without user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "Reaction not valid without comment" do
    subject.interactable = nil
    expect(subject).to_not be_valid
  end

  it "Reaction valid if interactable has a comment" do
    subject.interactable = comment
    expect(subject).to be_valid
  end

  it "Reaction not valid if interactable has not a comment" do
    subject.interactable = post
    expect(subject).to_not be_valid
  end
end
