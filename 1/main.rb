require "socket"
require "json"
require "prime"

PORT = 2000
server = TCPServer.new PORT

puts "########## TCP server running at #{PORT} ##########"

def valid_json?(string)
  !!JSON.parse(string)
  puts "valid json"
  true
rescue JSON::ParserError => e
  puts "invalid json: #{e.message}"
  false
end

def valid_fields?(line)
  json_object = JSON.parse(line)

  is_prime_method = json_object.include?("method") && json_object["method"].eql?("isPrime")
  puts "is_prime_method: #{is_prime_method}"

  has_number = json_object.include?("number") && json_object["number"].class.ancestors.include?(Numeric)
  puts "has_number: #{has_number}"

  is_prime_method && has_number
end

def is_prime(line)
  puts "Request: #{line}"

  return "malformed" unless valid_json?(line) && valid_fields?(line)

  json_object = JSON.parse(line)
  number = json_object["number"]

  prime = !number.class.eql?(Float) && Prime.prime?(number)

  { "method": "isPrime", "prime": prime }.to_json
end

loop do
  Thread.start(server.accept) do |client|
    puts "########## Conection stablished ##########"

    while line = client.gets
      client.puts is_prime(line)
    end

    client.close
    puts "########## Ended conection ########## \n"
  end
end

server.close
