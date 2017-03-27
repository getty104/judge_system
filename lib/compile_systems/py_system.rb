require 'zlib'
require 'base64'
stdin = Zlib::Inflate.new(Zlib::MAX_WBITS + 32).inflate(Base64.decode64($stdin.read)).split("\n<$><*><$>\n")
code = stdin[0]
input = stdin[1]
time = stdin[2]

File.open("./main.py", "w") do |file|
	file.puts code
	file.close
end

File.open("./test.in", "w") do |file|
	file.puts input
	file.close
end

system "timeout -s 9 " + time + " /opt/wandbox/cpython-head/bin/python3 main.py < test.in"
