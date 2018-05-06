# QuietRailsLogger
Stop logging of need not messages to log with an INFO level in production and staging enviroments, example:

>[2018-05-06 14:54:05]  INFO Started GET "/" for 127.0.0.1 at 2018-05-06 14:54:05 +0300
>[2018-05-06 14:54:05]  INFO Processing by HomeController#index as HTML 
>[2018-05-06 14:54:05]  INFO Parameters: {"url_prefix"=>""} 
>[2018-05-06 14:54:05]  INFO Rendered home/index.html.slim (9.9ms)  
>[2018-05-06 14:54:06]  INFO Completed 200 OK in 1068ms (Views: 953.2ms | ActiveRecord: 4.6ms)

## Usage
Add to config/initializers/quiet_rails_logger.rb:

QuietRailsLogger.configure do |config|
  config.environments = %w[production staging]
end

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'quiet_rails_logger'
```

And then execute:
```bash
$ bundle
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
