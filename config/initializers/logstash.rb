# config/initializers/logstash.rb
# Configure LogStashLogger to send logs to our remote Elk stack in production
if ENV["LOGSTASH_ENABLED"] == "true"
  Rails.logger = LogStashLogger.new(
    type: :multi_delegator,
    outputs: [
      { type: :file, path: "log/#{Rails.env}.log" },
      { type: :udp, host: ENV["LOGSTASH_HOST"], port: ENV["LOGSTASH_PORT"] }
    ]
  )

  # Add metadata for Logstash
  LogStashLogger.configure do |config|
    config.customize_event do |event|
      event["application"] = Rails.application.config.session_options[:key].sub(/^_/,"").sub(/_session/,"")
      event["environment"] = Rails.env

      event["@metadata"] = {
        beat: event["application"]
      }
    end
  end
end