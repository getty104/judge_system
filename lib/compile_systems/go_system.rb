require 'base64'

File.open('stdin.txt.bz2', 'wb') do |file|
  file.write Base64.decode64 $stdin.read
  file.close
end

system('bunzip2 stdin.txt.bz2')

stdin = File.open('stdin.txt').read.split("\n<$><*><$>\n")
code = stdin[0]
input = stdin[1]
time = stdin[2]

File.open('./main.go', 'w') do |file|
  file.puts code
  file.close
end

File.open('./test.in', 'w') do |file|
  file.puts input
  file.close
end

system('timeout -s 9 ' + time + ' /opt/wandbox/go-head/bin/go run main.go < test.in')
