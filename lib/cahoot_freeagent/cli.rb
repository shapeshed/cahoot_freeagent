require 'thor'
require 'cahoot_freeagent/csv'

module CahootFreeagent
  class CLI < Thor

    default_task :parse_html

    desc "Help", "Help text for the command line tool"
    def help
        puts 'This tool parses Cahoot HTML statements to a FreeAgentCentral compatible CSV file'
        puts 'Download statements from Cahoot and save as HTML files'
        puts 'Convert the files using the following syntax'
        puts 'cahoot_freeagent --files statement1.html statement2.html'
    end

    desc "Parse HTML", "Parses a Cahoot HTML statement and outputs an FreeAgent compatible CSV"
    method_options :files => :array
    def parse_html
      if options.files?
        options.files.each do |file|
          if FileTest.exists?(file)
            CahootFreeagent::CSV.new(file)
          else
            puts "The file #{file} was not found so was not converted"
          end
        end
      else
        puts 'Please specify some files to convert'
        puts 'USAGE: cahoot_freeagent --files statement.html'
      end
    end
  end
end
