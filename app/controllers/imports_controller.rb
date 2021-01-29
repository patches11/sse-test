class ImportsController < ActionController::Base
  include ActionController::Live
  def progress
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300)
    10.times { |i|
      #response.stream.write "hello world\n"
      sse.write({ name: "John #{i}"})
      puts i
      sleep 1
    }
  ensure
    response.stream.close
  end
end