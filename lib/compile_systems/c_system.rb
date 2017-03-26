require 'zlib'

File.open("./main.c", "w") do |file|
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
system "/opt/wandbox/gcc-head/bin/gcc main.c -o main -O2"
system "timeout -s 9 " + time + " ./main < test.in" 
