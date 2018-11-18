require 'judge_system/version'
require 'zlib_input'
require 'net/http'
require 'uri'
require 'json'

module JudgeSystem
  class WandBox
    def self.compile(compiler: '', code: '', stdin: '')
      body = {
        code: code,
        compiler: compiler,
        stdin: stdin
      }.to_json

      uri = URI.parse('http://melpon.org/wandbox/api/compile.json')
      request = Net::HTTP::Post.new(uri.request_uri, 'Content-type' => 'application/json')
      request.body = body
      http = Net::HTTP.new(uri.host, uri.port)
      response = http.request(request)
      JSON.parse(response.body)
    end

    def self.run(lang, code, input, time)
      path = File.expand_path(__dir__)
      sys = File.open("#{path}/compile_systems/#{lang}_system.rb", 'r').read
      spliter = "\n<$><*><$>\n"
      stdin = BZip2Input.compress(code + spliter + input + spliter + format('%<time>f', time: time))

      begin
        data = compile(compiler: 'ruby-head', code: sys, stdin: stdin)
      rescue StandardError
        return 'RE'
      end

      error = data['program_error']
      result = data['program_output']

      if error == "Killed\n"
        result = 'TLE'
      elsif result.nil? && error
        result = 'RE'
      end
      result
    end

    private_class_method :compile, :run

    def self.judge(lang, code, answer, stdin, time)
      output = run(lang, code, stdin, time)
      if %w[TLE RE].include?(output)
        output
      else
        output == answer ? 'AC' : 'WA'
      end
    end
  end

  module_function

  def judge_result(lang: '', code: '', answer: '', stdin: '', time: 20)
    WandBox.judge(lang, code, answer, stdin, time)
  end
end
