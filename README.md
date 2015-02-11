# SurferLeo

A very simple application meant to provide additional checks on referrer/origin 
headers to mitigate CSRF attacks on API driven websites.

You should still use additional protections, as redirection based attacks are
still effective, but this is a good additional step.

## Installation

In your Gemfile, add

```
gem 'surfer_leo'
```

## Usage
#### rack based apps

In your config.ru file

```ruby
require 'surfer_leo'

# ...

use SurferLeo::HostFilter, "yourdomain.com"

```

To see an example, look at the "config.ru" rackup file and the example.html page.

To verify that this is correctly filtering requests, start a websever in the 
local directory.

```
python -m SimpleHTTPServer
```

and then start the rackup containing surfer_leo.

```
bundle exec rackup config.ru
```

Visit [localhost:8000/example.html](localhost:8000/example.html) and make sure in the
debugger console you see a 400 request to localhost:9292. Congratulations, you're filtering
the most basic CSRF attacks now!

#### rails based apps

In some cases, particularly in rails applications, you may want to allow cross 
domain requests in some environments. In testing, you may want to operate on a 
vm on a different domain. In this case, it makes sense to only add these
filters to the correct environment.

e.g., in config/environments/production.rb

```
config.middlewares.use SurferLeo::HostFilter, "foobar.com"
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/surfer_leo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Wait
7. Email politely reminding maintainer of pull request.
8. Wait
9. Maintainer eventually replies, probably dismissively of your legitimate 
   problem.
10. Calmly explain in simple words the flaw in maintainers logic.
11. 2 day pause 
12. Patch is begrudgingly merged
