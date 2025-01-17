require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: "Amazing title", post_type: "story", url: "http://test.fr", score: 222, author: "Author") }

  it "Post valid with all arguments" do
    expect(subject).to be_valid
    subject.save!
    expect(subject.id).to_not be nil
    expect(subject.title).to eq "Amazing title"
    expect(subject.post_type).to eq "story"
    expect(subject.url).to eq "http://test.fr"
    expect(subject.score).to eq 222
    expect(subject.author).to eq "Author"
  end

  it "Post not valid without title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "Post not valid without post_type" do
    subject.post_type = nil
    expect(subject).to_not be_valid
  end

  it "Post not valid without url" do
    subject.url = nil
    expect(subject).to_not be_valid
  end

  it "Post not valid without score" do
    subject.score = nil
    expect(subject).to_not be_valid
  end

  it "Post not valid without title" do
    subject.author = nil
    expect(subject).to_not be_valid
  end
end
