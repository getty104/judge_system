require 'base64'

File.open("stdin.txt.bz2", "wb") do |file|
	file.write Base64.decode64 $stdin.read
	file.close
end

system("bunzip2 stdin.txt.bz2")

stdin = File.open("stdin.txt").read.split("\n<$><*><$>\n")
code = stdin[0]
input = stdin[1]
time = stdin[2]

File.open("./main.swift", "w") do |file|
	file.puts code
	file.close
end

File.open("./test.in", "w") do |file|
	file.puts input
	file.close
end

system "/opt/wandbox/swift-head/usr/bin/swiftc main.swift -o main"
system "timeout -s 9 " + time + " ./main < test.in" 