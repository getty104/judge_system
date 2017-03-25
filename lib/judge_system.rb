require "judge_system/version"
require "net/http"
require "uri"
require "json"
require 'timeout'
require 'pathname'

module JudgeSystem
	module Wandbox 
		module Web
			def compile compiler: "", code: "", codes: [], options: "", stdin: "", compiler_option_raw: "", runtime_option_raw: "", save: false
				body = {
					"code" => code,
					"compiler" => compiler,
					"codes" => codes,
					"options" => options,
					"stdin" => stdin,
					"compiler-option-raw" => compiler_option_raw,
					"runtime-option-raw" => runtime_option_raw,
					"save" => save,
				}
				uri = URI.parse("http://melpon.org/wandbox/api/compile.json")

				request = Net::HTTP::Post.new(uri.request_uri, initheader = { "Content-type" => "application/json" },)
				request.body = body.to_json
				http = Net::HTTP.new(uri.host, uri.port)


				http.start do |http|
					response = http.request(request)
					JSON.parse(response.body)
				end

			end
			module_function :compile
		end
	end

	module Wandbox
		def run lang, code, input, time
			path = File.expand_path('../', __FILE__ )
			sys = File.open("#{path}/compile_systems/#{lang}_system.cpp", "r").read
			data = nil
			spliter = "\n<$><*><$>\n"
			stdin = code + spliter + input + spliter + time.to_s
			begin
			p	data = Web.compile({ compiler: "gcc-head", code: sys, stdin: stdin })
			rescue
				return 'RE'
			end
			error = data["program_error"]
			result = data["program_output"]
			if error == "Killed\n"
				return 'TLE'
			elsif result == nil && error 
				return "RE"
			else
				return result
			end
		end
		module_function :run
	end

	def judge_result lang: "", code: "" , answer: "", stdin: "", time: 100
		output = Wandbox.run lang, code, stdin, time
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
	module_function :judge_result
end
