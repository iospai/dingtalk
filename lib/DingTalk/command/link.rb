require 'colored2'

require_relative '../utils/http_helper'

module DingTalk
  class Command
    class Link < Command
      self.summary = '发送link类型消息'

      self.description = <<-DESC
          发送text类型消息，消息内容为`CONTENT`
      DESC

      self.arguments = [
        CLAide::Argument.new('content', true)
      ]

      def self.options
        [
          %w(--title=`title` 消息内容。如果太长只会部分展示。),
          %w(--link=`link` 点击消息跳转的URL。),
          %w(--pic=`pic` 图片URL。),
        ].concat(super)
      end

      def initialize(argv)
        @content = argv.shift_argument
        @title = argv.option('title');
        @message_url = argv.option('link');
        @pic_url = argv.option('pic');
        super
      end

      def validate!
        super
        help! 'A message title is required.' unless @title
        help! 'A message content is required.' unless @content
        help! 'A message link is required.' unless @message_url
      end

      def run
        res = DingTalk::HttpHelper.send_link(@title, @text, @pic_url, @message_url, @token, @secret)
        puts res.bold.green
      end

    end
  end
end
