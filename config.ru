require 'rack'
require 'rack/lobster'
require 'surfer_leo'

use SurferLeo::HostFilter, "yourdomainhere.com"
# use SurferLeo::HostFilter, "localhost" ### Uncomment this line, and the example.html file will work fine
run Rack::Lobster.new 
