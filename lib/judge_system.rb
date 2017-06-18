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
      path = File.expand_path('../', __FILE__)
      sys = File.open("#{path}/compile_systems/#{lang}_system.rb", 'r').read
      data = nil
      spliter = "\n<$><*><$>\n"
      stdin = BZip2Input.compress(code + spliter + input + spliter + format('%f', time))
      begin
        data = compile(compiler: 'ruby-head', code: sys, stdin: stdin)
      rescue
        return 'RE'
      end
      error = data['program_error']
      result = data['program_output']
      return 'TLE' if error == "Killed\n"
      return 'RE'  if result.nil? && error
      result
    end

    private_class_method :compile, :run

    def self.judge(lang, code, answer, stdin, time)
      output = run(lang, code, stdin, time)
      return 'TLE' if output == 'TLE'
      return 'RE'  if output == 'RE'
      output == answer ? 'AC' : 'WA'
    end
  end

  def judge_result(lang: '', code: '', answer: '', stdin: '', time: 20)
    WandBox.judge(lang, code, answer, stdin, time)
  end

  module_function :judge_result
end
