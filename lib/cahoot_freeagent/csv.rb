require 'nokogiri'
require 'fastercsv'
require 'time'
module CahootFreeagent
    class CSV
      def initialize(html)
        @target = html.gsub(/html$/, 'csv')
        parse_html(html)    
        puts html + ' -> ' + @target
      end

      def parse_html(html)
        doc = Nokogiri::HTML(open(html))
        doc.css("table.dataTable tr:not(:first-child)").each do |item|
          @date = clean_string(item.at_css('td:nth-child(1)'))
          @description = clean_string(item.at_css('td:nth-child(2)'))
          withdrawn = clean_string(item.at_css('td:nth-child(3)'))
          paid_in = clean_string(item.at_css('td:nth-child(4)'))
          @amount = paid_in.empty?  ? "-" + withdrawn : paid_in
          FasterCSV.open(@target, 'a') do |csv|
            csv << [format_date(@date),@amount,@description]
          end
        end
      end

      def clean_string(string)
        string.text.gsub(/\302\240/, '').gsub(/£/, '')
      end

      def format_date(date)
        Time.parse(date).strftime("%d/%m/%Y")
      end

      def format_description(description)
        description.gsub(/(.*)/, '\1')
      end

    end

end
