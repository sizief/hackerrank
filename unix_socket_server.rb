require "socket"

server = UNIXServer.new('/tmp/simple.sock')

puts "==== Waiting for connection"
socket = server.accept

puts "==== Got Request:"
puts socket.readline

# # Read everything from the socket
# while line = socket.readline
#   puts line.inspect
# end

puts "==== Sending Response"
socket.write("I read you loud and clear, good buddy!")

socket.close
