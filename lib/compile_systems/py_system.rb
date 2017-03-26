require 'zlib'

File.open("./main.py", "w") do |file|
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
system "timeout -s 9 " + time + " /opt/wandbox/cpython-head/bin/python3 main.py < test.in"
