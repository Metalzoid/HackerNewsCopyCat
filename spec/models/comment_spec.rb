require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(email: "test@test.fr", password: "azerty", username: "username test") }
  let(:post) { Post.create!(title: "Amazing post", post_type: "story", url: "http://test.fr", author: "Author", score: 222) }
  subject { Comment.new(content: "Some comment", user: user, interactable: post) }

  it "Comment valid with all arguments" do
    expect(subject).to be_valid
    expect(subject.type).to eq "Comment"
  end

  it "Comment not valid without content" do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it "Comment not valid without user" do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it "Comment not valid without post" do
    subject.interactable = nil
    expect(subject).to_not be_valid
  end
end
