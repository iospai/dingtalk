require_relative '../utils/http_helper'

module DingTalk
  class Command
    class FeedCard < Command
      self.summary = '发送FeedCard类型消息'

      self.description = <<-DESC
          发送text类型消息，消息内容为`LINK Array JSON`,格式：`[{ "title": "xxx", "pic": "https://xxx.com/icon.png", "link": "https://xxx.com/" }]`
      DESC

      self.arguments = [
        CLAide::Argument.new('JSONArray', true)
      ]

      def self.options
        [
        ].concat(super)
      end

      def initialize(argv)
        links_str = argv.shift_argument
        @links = []
        if links_str then
          begin
            JSON.parser(links_str).each do | link |
              @links << DingTalk::Message::FeedCardLink.new(link.title, link.pic, link.link) if link.title && link.pic && link.link
            end
          rescue
          ensure
          end
        end
        super
      end

      def validate!
        super
        help! 'A message button is required.' unless @links.size < 1
      end

      def run
        res = DingTalk::HttpHelper.send_feed_card(@links)
        puts res
      end

    end
  end
end

