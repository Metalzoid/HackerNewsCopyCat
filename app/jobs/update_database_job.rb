require "open-uri"

class UpdateDatabaseJob < ApplicationJob
  queue_as :default

  def perform(*args)
    list_serialized = URI.parse('https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty').read
    list = JSON.parse(list_serialized)

    list.each do |item|
      post_serialized = URI.parse("https://hacker-news.firebaseio.com/v0/item/#{item}.json?print=pretty").read
      post = JSON.parse(post_serialized)
      new_post = Post.find_or_initialize_by(title: post["title"], post_type: post["type"], url: post["url"], score: post["score"], author: post["by"])
      if new_post.valid? && !new_post.id
        new_post.save!
        puts "#{new_post.title} created."
      else
        next
      end
    end
    puts 'all Done'
  end
end
