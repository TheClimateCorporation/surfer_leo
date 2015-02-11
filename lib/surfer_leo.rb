require "surfer_leo/version"
require "uri"

module SurferLeo

  class HostFilter
    def initialize(app, hosts)
      @hosts = hosts
      @app = app
    end

    def call(env)
      ["HTTP_REFERER", "HTTP_ORIGIN"].each do |header|
        if @referrer = env[header] 
          unless @hosts.include?(URI(@referrer).host)
            return render_unauthed
          end
        end
      end
      @app.call(env)
    end

    def render_unauthed
      [400, {"Content-Type" => "text/plain"}, ["CSRF violation, request must occur on clemens domain"]]
    end
  end
end
