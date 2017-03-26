require 'zlib'

File.open("./main.rb", "w") do |file|
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
system "timeout -s 9 " + time + " /opt/wandbox/ruby-head/bin/ruby main.rb < test.in" 
