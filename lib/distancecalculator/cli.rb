module Distancecalculator
  require 'thor'
  require 'json'
  require 'distancecalculator/customer'


  class Cli < Thor
    desc "nearby PATH", "Returns nearby customers in the PATH json who are within 100k radius ."
    def nearby(path)
      customers = parse_json(path).map do |customer_data|
        Customer.new(customer_data)
      end
      # Since we just want to print out the user info of nearby customers
      # there's no point in filtering the customer list and use and other
      # loop to print them. I merged them.
      customers.map do |customer|
        print_out(customer) if customer.nearby?
      end
    rescue Errno::ENOENT
      puts "Could not find customer file at `#{path}`"

    rescue JSON::ParserError
      puts "Can not read the JSON data"
    end

    private

    def parse_json(path)
      content = File.read(path).split(/$/)
      content.map { |line| JSON.parse(line) }
    end

    def print_out(customer)
      puts "Name: #{customer.name} USER ID: #{customer.user_id}"
    end
  end
end
