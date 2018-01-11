require 'rack'

class PathRouteMiddleware
  attr_reader :next_middleware

  def initialize(next_middleware)
    @next_middleware = next_middleware
  end

  def call(env)
    req = Rack::Request.new(env)
    if req.path
      res = Rack::Response.new
      res.headers['Content-Type'] = 'text/html'
      res.body = ["<p>#{req.path}</p>"]

      return res.finish
    end

    # return next_middleware.call(env)
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write("Hello world!")
  res.finish
end

middleware_stack = Rack::Builder.new do
  self.use PathRouteMiddleware
  self.run app
end.to_app

Rack::Handler::WEBrick.run(
  middleware_stack,
  Port: 3000
)
