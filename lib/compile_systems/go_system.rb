require 'zlib'

File.open("./main.go", "w") do |file|
	loop{
		str = gets.chomp.to_s
		break if str == "<$><*><$>"
		file.puts str
	}
	file.close
end

File.open("./test.in", "w") do |file|
	loop{
		str = gets.chomp.to_s
		break if str == "<$><*><$>"
		file.puts Zlib::Inflate.inflate(str)
	}
	file.close
end
time = gets
system "timeout -s 9 " + time + " /opt/wandbox/go-head/bin/go run main.go < test.in" 
