require 'twitter'
require 'yaml'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end

  def get_friends
    @client.friends
    #how
  end

  def most_recent_friend
    get_friends.first
    #about
  end

  def find_user_for(username)
    @client.user(username)
    #you
  end

  def find_followers_for(username)
    @client.followers(username).take(10)
    #pass!!!!!
  end

  def homepage_timeline
    @client.home_timeline
    #please
  end

end

#PASS YOU BITCH
