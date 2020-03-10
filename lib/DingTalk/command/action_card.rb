require 'colored2'

require_relative '../utils/http_helper'

module DingTalk
  class Command
    class ActionCard < Command
      self.summary = '发送整体跳转ActionCard类型消息'

      self.description = <<-DESC
          发送text类型消息，消息内容为`CONTENT`
      DESC

      self.arguments = [
        CLAide::Argument.new('content', true)
      ]

      def self.options
        [
          %w(--title=XXX 消息内容。如果太长只会部分展示。),
          %w(--buttons=JSON数组 按钮的信息`[{ "title": "xxx", "url": "https://xxx.com", "pic": "https://xxx.com/" }]`),
          %w(--orientation [可选]按钮是否按钮横向排列),
          %w(--hide [可选]是否隐藏发消息者头像),
        ].concat(super)
      end

      def initialize(argv)
        @content = argv.shift_argument
        @title = argv.option('title');
        buttons_str = argv.option('buttons');
        @buttons = []
        if buttons_str then
          begin
            JSON.parser(buttons_str).each do | button |
              @buttons << DingTalk::Message::ActionCardButton.new(button.title, button.url) if button.title && button.url
            end
          rescue
          ensure
          end
        end
        @btn_orientation = argv.flag?('orientation', false)
        @hide_avatar = argv.flag?('hide', false)
        super
      end

      def validate!
        super
        help! 'A message title is required.' unless @title
        help! 'A message content is required.' unless @content
        help! 'A message button is required.' unless @buttons.size < 1
      end

      def run
        res = DingTalk::HttpHelper.send_action_card2(@title, @text, @buttons, @btn_orientation, @hide_avatar, @token, @secret)
        puts res.bold.green
      end

    end
  end
end
