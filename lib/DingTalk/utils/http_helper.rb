require 'faraday';
require 'faraday_middleware'

module DingTalk
  class HttpHelper
    WEBHOOK_DINGTALK_URL = 'https://oapi.dingtalk.com/robot/send'.freeze
    WEBHOOK_DINGTALK_TOKEN = 'b2bcaa01e512f1981774b96dcb6a289d998133f1598274b6f6c7e19a701ad0c5'.freeze

    def self.send_http(params = {})
      url = "#{ WEBHOOK_DINGTALK_URL }?access_token=#{ WEBHOOK_DINGTALK_TOKEN }"
      http_client = Faraday.new() do |builder|
        builder.request  :url_encoded
        builder.request  :json
        builder.response :logger
        builder.adapter  :net_http
      end
      res = http_client.post url, params.to_json, 'Content-Type' => 'application/json'
      res.body
    end

    def self.send_msg(message)

    end

    def self.send_text(message)

    end

    def self.send_markdown(message)

    end
  end
end

