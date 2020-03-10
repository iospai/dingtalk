require 'faraday';
require 'faraday_middleware'

require_relative '../core/text'
require_relative '../core/link'
require_relative '../core/markdown'
require_relative '../core/action_card'
require_relative '../core/action_card2'
require_relative '../core/feed_card'

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

    def self.send_text(content, at_mobiles = [], is_at_all = false)
      send_http DingTalk::Message::Text.new(content, at_mobiles, is_at_all)
    end

    def self.send_link(title, text, pic_url, message_url = '')
      send_http DingTalk::Message::Link.new(title, text, pic_url, message_url)
    end

    def self.send_markdown(title, text, at_mobiles = [], is_at_all = false)
      send_http DingTalk::Message::Markdown.new(title, text, at_mobiles, is_at_all)
    end

    def self.send_action_card(title, text, single_title, single_url, btn_orientation = '0', hide_avatar = '0')
      send_http DingTalk::Message::ActionCard.new(title, text, single_title, single_url, btn_orientation, hide_avatar)
    end

    def self.send_action_card2(title, text, buttons, btn_orientation = '0', hide_avatar = '0')
      send_http DingTalk::Message::ActionCard2.new(title, text, buttons, btn_orientation, hide_avatar)
    end

    def self.send_feed_card(links)
      send_http DingTalk::Message::FeedCard.new(links)
    end

  end
end

