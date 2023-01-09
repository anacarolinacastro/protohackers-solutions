require 'socket'

PORT = 2000
server = TCPServer.new PORT

puts "########## TCP server running at #{PORT} ##########"

loop do
  Thread.start(server.accept) do |client|
    puts "########## Conection stablished ##########"

    while line = client.gets
      puts line; client.write line
    end

    client.close
    puts "########## Ended conection ########## \n"
  end
end

server.close