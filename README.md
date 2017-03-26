[![wercker status](https://app.wercker.com/status/0964573b38729ce98909559e3779cca5/s/master "wercker status")](https://app.wercker.com/project/byKey/0964573b38729ce98909559e3779cca5)
# JudgeSystem

Judge_system is a compile and judge system for online judge.  
This system work on [melpon/wandbox](https://github.com/melpon/wandbox).  
That means you don't have to concern about dangerous codes if you use judge_system.  
Judge_system returns four results ('AC', 'WA', 'RE', 'TLE').  
Now, it can compile c, c++, ruby, go, python3.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'judge_system'
```

And then execute:

$ bundle

Or install it yourself as:

$ gem install judge_system

## Usage

```ruby
require 'judge_system'

JudgeSystem.judge_result lang: (string text), code: (string text), answer: (string text), stdin: (string text), time: (num sec)

#Lang is the extension of languages (example: c is 'c', c++ is 'cpp', ruby is 'rb', go is 'go', python3 is 'py').
#You can't use more than 2M byte code and input.

```

example  

```ruby
require 'judge_system'

p JudgeSystem.judge_result lang: 'rb', code: "n = gets.to_i\nputs n", answer: "1\n", stdin: "1\n", time: 5 #=> 'AC'
p JudgeSystem.judge_result lang: 'rb', code: "n = gets.to_i\nputs n", answer: "1\n", stdin: "2\n", time: 5 #=> 'WA'
p JudgeSystem.judge_result lang: 'rb', code: "n = gets.to_i\nputs n", answer: "1\n", stdin: "\n", time: 0.001 #=> 'TLE'
p JudgeSystem.judge_result lang: 'c',  code: "n = gets.to_i\nputs n", answer: "1\n", stdin: "1\n", time: 5 #=> 'RE'
```





## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/judge_system. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

