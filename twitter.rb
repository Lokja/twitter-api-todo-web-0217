require 'twitter'
require 'yaml'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @clientz = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end

  def get_friends
    @clientz.friends
  end

  def most_recent_friend
    get_friends.first
  end

  def find_user_for(username)
    #find the twitter gem method that returns the correct user, given a username
    @clientz.user(username)
  end

  def find_followers_for(username)
    @clientz.followers(username).take(10)
  end

  def homepage_timeline
    @clientz.home_timeline
  end

end
