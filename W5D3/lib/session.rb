require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    @req = req
    cookie_value = Rack::Request.cookies['_rails_lite_app']
    @cookie = cookie_value ? JSON.parse(cookie_value) : Hash.new {[]}
  end

  def [](key)
    @cookie[key.to_sym]
  end

  def []=(key, val)
    @cookie[key.to_sym] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    @cookie[:path] = "/"
    @cookie = @cookie.to_json
    Rails::Response.set_cookie('_rails_lite_app', @cookie)
  end
end
