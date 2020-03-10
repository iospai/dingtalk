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

    def self.send_http(params = {}, token = nil)
      access_token = token || ENV['DINGTALK_TOKEN']
      return 'A message access token is required.' unless access_token
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

    def self.send_text(content, at_mobiles = [], is_at_all = false, token = nil)
      send_http DingTalk::Message::Text.new(content, at_mobiles, is_at_all), token
    end

    def self.send_link(title, text, pic_url, message_url = '', token = nil)
      send_http DingTalk::Message::Link.new(title, text, pic_url, message_url), token
    end

    def self.send_markdown(title, text, at_mobiles = [], is_at_all = false, token = nil)
      send_http DingTalk::Message::Markdown.new(title, text, at_mobiles, is_at_all), token
    end

    def self.send_action_card(title, text, single_title, single_url, btn_orientation = '0', hide_avatar = '0', token = nil)
      buttons = [
        DingTalk::Message::ActionCardButton.new(single_title, single_url)
      ]
      send_http DingTalk::Message::ActionCard.new(title, text, buttons, btn_orientation, hide_avatar), token
    end

    def self.send_action_card2(title, text, buttons, btn_orientation = '0', hide_avatar = '0', token = nil)
      send_http DingTalk::Message::ActionCard.new(title, text, buttons, btn_orientation, hide_avatar), token
    end

    def self.send_feed_card(links, token = nil)
      send_http DingTalk::Message::FeedCard.new(links), token
    end

  end
end

