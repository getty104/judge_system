# JudgeSystem

Judge_system is a compile and judge system for online judge.  
This system work on [melpon/wandbox](https://github.com/melpon/wandbox).  
That means you don't have to concern about dangerous codes if you use judge_system.  
Judge_system returns four results ('AC', 'WA', 'RE', 'TLE').  
Now, it can compile c, c++, ruby, java.  

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

JudgeSystem.judge_result lang(string text), code(string text), answer(string text), input(string text), time-limit(num sec)

#Lang is the extension of languages (example: c is 'c', c++ is 'cpp', ruby is 'rb', java is 'java').
#You can't use more than 1M byte code, input, answer.

```

example  

```ruby
require 'judge_system'

p JudgeSystem.judge_result 'rb', "n = gets.to_i\nputs n", "1\n", "1\n", 5 #=> 'AC'
p JudgeSystem.judge_result 'rb', "n = gets.to_i\nputs n", "1\n", "2\n", 5 #=> 'WA'
p JudgeSystem.judge_result 'rb', "n = gets.to_i\nputs n", "1\n", "\n", 0.001 #=> 'TLE'
p JudgeSystem.judge_result 'c', "n = gets.to_i\nputs n", "1\n", "1\n", 5 #=> 'RE'
```





## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/judge_system. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

