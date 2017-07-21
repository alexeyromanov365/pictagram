class MyMiddleware
  def initialize app, formatting_char = '='
    @app = app
    @formatting_char = formatting_char
  end

  def call env
    request_started_on = Time.now
    @status, @headers, @response = @app.call(env)
    request_ended_on = Time.now
    write_log("Request took #{request_ended_on - request_started_on} seconds.")
    [@status, @headers, @response]
  end

  private

  def write_log(message)
  	log_data = "[#{Time.now}]: #{message}\n"
  	File.write('log/middleware.log', log_data, mode: 'a+')
  end
end