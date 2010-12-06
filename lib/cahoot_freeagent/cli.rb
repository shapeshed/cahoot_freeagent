require 'thor'
module CahootFreeagent
  class CLI < Thor
    desc "portray ITEM", "Determines if a piece of food is gross or delicious"
    def portray
        puts 'portray method'
    end
  end
end
