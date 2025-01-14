require "open-uri"
require "pry-byebug"

puts "Destroying all posts..."
Post.destroy_all
puts "All posts destroyed !"

list_serialized = URI.parse('https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty').read
list = JSON.parse(list_serialized)

list.each do |item|
  post_serialized = URI.parse("https://hacker-news.firebaseio.com/v0/item/#{item}.json?print=pretty").read
  post = JSON.parse(post_serialized)
  new_post = Post.new(title: post["title"], post_type: post["type"], url: post["url"], score: post["score"], author: post["by"])
  if new_post.valid?
    new_post.save!
    puts "#{new_post.title} created."
  else
    next
  end
end
puts 'all Done'
