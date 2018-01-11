require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'active_support/inflector'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params)
    @req = req
    @res = res
    @already_render = false
    @already_redirect = false
    @params = params
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_render || @already_redirect
  end

  # Set the response status code and header
  def redirect_to(url)
    if already_built_response?
      raise 'Already rendered'
    else
      @res.redirect(url, status = 302)
      @session.store_session(@res)
      @already_redirect = true
      nil
    end
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    if already_built_response?
      raise 'Already rendered'
    else
      @res.write(content)
      @res.header['Content-Type'] = content_type
      @already_render = true
      @session.store_session(@res)
      nil
    end
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    if already_built_response?
      raise 'Already rendered'
    else
      # debugger
      controller = self.class.to_s.underscore
      file_path = "./views/#{controller}/#{template_name.to_s}.html.erb"
      file = File.read(file_path)
      content = ERB.new(file).result(binding)
      self.render_content(content, 'text/html')
    end
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
    # @session.store_session(@res)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end
