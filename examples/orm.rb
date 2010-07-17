require "rubygems"
require "bundler"
Bundler.setup

require 'tramp'

Tramp.init(:username => 'root', :database => 'arel_development')

class User < Tramp::Base
  attribute :id, :type => Integer, :primary_key => true
  attribute :name

  validates_presence_of :name
end

EM.run do
  user = User.new

  user.save do |status|
    if status.success?
      puts "WTF!"
    else
      puts "Oops. Found errors : #{user.errors.inspect}"

      user.name = 'Lush'
      user.save do
        User.where(User[:name].eq('Lush')).all {|users| puts users.inspect; EM.stop }
      end
    end
  end
end
