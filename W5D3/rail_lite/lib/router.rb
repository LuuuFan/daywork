class Route
  attr_reader :pattern, :http_method, :controller_class, :action_name

  def initialize(pattern, http_method, controller_class, action_name)
    @pattern = pattern
    @http_method = http_method
    @controller_class = controller_class
    @action_name = action_name
  end

  # checks if pattern matches path and method matches request method
  def matches?(req)
    @http_method.to_s.downcase == req.request_method.downcase &&
    @pattern =~ req.path
  end

  # use pattern to pull out route params (save for later?)
  # instantiate controller and call controller action
  def run(req, res)
    if matches?(req)
      @controller_class.new(req, res, {}).invoke_action(@action_name)
    end
  end
end

class Router
  attr_reader :routes

  def initialize
    @routes = []
  end

  # simply adds a new route to the list of routes
  def add_route(pattern, method, controller_class, action_name)
    @routes << Route.new(pattern, method, controller_class, action_name)
  end

  # evaluate the proc in the context of the instance
  # for syntactic sugar :)
  def draw(&proc)
    self.instance_eval(&proc)
  end

  # make each of these methods that
  # when called add route
  [:get, :post, :put, :delete].each do |http_method|
    define_method(http_method) do |*arg|
      self.add_route(arg[0], http_method, arg[1], arg[2])
    end
  end

  # should return the route that matches this request
  def match(req)
    result = nil
    @routes.each do |route|
      if route.matches?(req)
        result = route
        break
      end
    end
    result
  end

  # either throw 404 or call run on a matched route
  def run(req, res)
    if match(req).nil?
      res.status = 404
    else

    end
  end
end
