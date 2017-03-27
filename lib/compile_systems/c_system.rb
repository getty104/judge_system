require 'zlib'
require 'base64'
stdin = Zlib::Inflate.new(Zlib::MAX_WBITS + 32).inflate(Base64.decode64($stdin.read)).split("\n<$><*><$>\n")
code = stdin[0]
input = stdin[1]
time = stdin[2]

File.open("./main.c", "w") do |file|
	file.puts code
	file.close
end

File.open("./test.in", "w") do |file|
	file.puts input
	file.close
end

system "/opt/wandbox/gcc-head/bin/gcc main.c -o main -O2"
system "timeout -s 9 " + time + " ./main < test.in" 
