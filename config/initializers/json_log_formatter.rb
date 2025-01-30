require 'logger'
require 'json'

class JsonLogFormatter < Logger::Formatter
  def call(severity, time, progname, msg)
    log_data = {
      timestamp: time.utc.iso8601,
      level: severity,
      message: msg.to_s,
      progname: progname
    }
    "#{log_data.to_json}\n"
  end
end
