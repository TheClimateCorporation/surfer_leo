require 'spec_helper'


describe SurferLeo::HostFilter do
  let(:app) { proc {
    [200, {}, ["The request made it through"]]
  }}
  let(:host) { "example.com" }
  let(:middleware) { SurferLeo::HostFilter.new(app, [host]) }

  it "filters requests that have the wrong headers" do
    origin_env = {"HTTP_ORIGIN" => "https://foobarius.com" }
    response = middleware.call(origin_env)
    expect(response.first).to eq(400)

    referer_env = {"HTTP_REFERER" => "https://foobarius.com" }
    response = middleware.call(referer_env)
    expect(response.first).to eq(400)
  end

  it "doesn't filter requests that have the right domain" do
    origin_env = {"HTTP_ORIGIN" => "https://example.com" }
    response = middleware.call(origin_env)
    expect(response.first).to eq(200)

    referer_env = {"HTTP_REFERER" => "http://example.com" }
    response = middleware.call(referer_env)
    expect(response.first).to eq(200)
  end

end
