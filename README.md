# Simple Speed Tester Gem

Makes it super simple to test the speed of a given request or set of requests.

Especially useful from the console.

**Table of Contents**
* [Installation](#installation)
* [Usage](#usage)
* [Other Things](#Other_Things)

# Installation
Add this line to your application's Gemfile:
```ruby
gem 'simple_speed_tester'
```
And then execute:
    $ bundle
Or install it yourself as:
    $ gem install simple_speed_tester


# Usage
```ruby
SimpleSpeedTester.measure(profile_id, times: num_times)
# @param profile_id [String|Symbol] What key should we use to reference this speed test later? If not specified then we'll just create one.
# @option times [Integer] (optional) How many times should we run this test? You can run the class method multiple times but you can also set this number to easily run it multiple times in one line.
```

### Example: Test speed to google

```ruby
SimpleSpeedTester.measure("request to google.com", times: 10) { HTTParty.get('https://www.google.com') }
# output: request to google.com >>> {:total_time=>2.25232, :times_called=>10, :avg_time=>0.22523200000000002
```


# Other Things
### Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/jayelkaake/simple_speed_tester.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

### License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
