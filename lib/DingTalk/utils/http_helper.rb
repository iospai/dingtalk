require 'faraday';
require 'faraday_middleware'

require_relative '../core/text'
require_relative '../core/link'
require_relative '../core/markdown'
require_relative '../core/action_card'
require_relative '../core/feed_card'

module DingTalk
  class HttpHelper
    DINGTALK_URL = 'https://oapi.dingtalk.com/robot/send'.freeze

    def self.send_http(params = {}, token = nil, secret = nil)
      access_token = token || ENV['DINGTALK_TOKEN']
      access_secret = token || ENV['DINGTALK_SECRET']
      return 'A message access token is required.' unless access_token
      if access_secret then
        timestamp = "#{ Time.now.to_i * 1000 }\n#{ access_secret }"



        # Long timestamp = System.currentTimeMillis();
        # String stringToSign = timestamp + "\n" + secret;
        # Mac mac = Mac.getInstance("HmacSHA256");
        # mac.init(new SecretKeySpec(secret.getBytes("UTF-8"), "HmacSHA256"));
        # byte[] signData = mac.doFinal(stringToSign.getBytes("UTF-8"));
        # return URLEncoder.encode(new String(Base64.encodeBase64(signData)),"UTF-8");




      end
      url = "#{ DINGTALK_URL }?access_token=#{ access_token }"
      http_client = Faraday.new() do |builder|
        builder.request  :url_encoded
        builder.request  :json
        builder.response :logger
        builder.adapter  :net_http
      end
      res = http_client.post url, params.to_json, 'Content-Type' => 'application/json'
      res.body
    end

    def self.send_text(content, at_mobiles = [], is_at_all = false, token = nil, secret = nil)
      send_http DingTalk::Message::Text.new(content, at_mobiles, is_at_all), token, secret
    end

    def self.send_link(title, text, pic_url, message_url = '', token = nil, secret = nil)
      send_http DingTalk::Message::Link.new(title, text, pic_url, message_url), token, secret
    end

    def self.send_markdown(title, text, at_mobiles = [], is_at_all = false, token = nil, secret = nil)
      send_http DingTalk::Message::Markdown.new(title, text, at_mobiles, is_at_all), token, secret
    end

    def self.send_action_card(title, text, single_title, single_url, btn_orientation = '0', hide_avatar = '0', token = nil, secret = nil)
      buttons = [
        DingTalk::Message::ActionCardButton.new(single_title, single_url)
      ]
      send_http DingTalk::Message::ActionCard.new(title, text, buttons, btn_orientation, hide_avatar), token, secret
    end

    def self.send_action_card2(title, text, buttons, btn_orientation = '0', hide_avatar = '0', token = nil, secret = nil)
      send_http DingTalk::Message::ActionCard.new(title, text, buttons, btn_orientation, hide_avatar), token, secret
    end

    def self.send_feed_card(links, token = nil, secret = nil)
      send_http DingTalk::Message::FeedCard.new(links), token, secret
    end

  end
end

