require 'judge_system/version'
require 'zlib_input'
require 'net/http'
require 'uri'
require 'json'
require 'pathname'

module JudgeSystem
	class WandBox

		def self.compile compiler: '', code: '', stdin: ''

			body = {
				code: code,
				compiler: compiler,
				stdin: stdin,
			}.to_json

			uri = URI.parse('http://melpon.org/wandbox/api/compile.json')
			request = Net::HTTP::Post.new( uri.request_uri, { 'Content-type' => 'application/json' } )
			request.body = body
			http = Net::HTTP.new(uri.host, uri.port)
			response = http.request(request)
			JSON.parse(response.body)
		end

		def self.run lang, code, input, time
			path = File.expand_path('../', __FILE__ )
			sys = File.open( "#{path}/compile_systems/#{lang}_system.rb", 'r' ).read
			data = nil
			spliter = "\n<$><*><$>\n"
			stdin = BZip2Input.compress( code + spliter + input + spliter +  ("%f" % time) )
			begin
				data = compile( compiler: 'ruby-head', code: sys, stdin: stdin )
			rescue
				return 'RE'
			end
			error = data['program_error']
			result = data['program_output']
			if error == "Killed\n"
				return 'TLE'
			elsif result == nil && error
				return 'RE'
			else
				return result
			end
		end
		private_class_method :compile, :run

		public
		def self.judge lang, code , answer, stdin, time
			output = run lang, code, stdin, time
			if output == 'TLE'
				return 'TLE'
			elsif output == 'RE'
				return 'RE'
			else
				result = output == answer
				if result
					return 'AC'
				else
					return 'WA'
				end
			end
		end
	end

	def judge_result lang: '', code: '', answer: '', stdin: '', time: 20
		WandBox.judge lang, code, answer, stdin, time
	end

	module_function :judge_result
end
