require 'colored2'

require_relative '../utils/http_helper'

module DingTalk
  class Command
    class Text < Command
      self.summary = '发送Text类型消息'

      self.description = <<-DESC
          发送Text类型消息，消息内容为`CONTENT`
      DESC

      self.arguments = [
        CLAide::Argument.new('content', true)
      ]

      def self.options
        [
          %w(--at=`at` [可选]被@人的手机号(在content里添加@人的手机号)，多个手机号以英文逗号（`,`）分隔。),
          %w(--all [可选]@所有人),
        ].concat(super)
      end

      def initialize(argv)
        @content = argv.shift_argument
        at_str = argv.option('at');
        @at_mobiles = []
        if at_str then
          at_str.split(%r{,\s*}).each do |at_mobile|
            @at_mobiles << at_mobile unless at_mobile.nil? || at_mobile.empty?
          end
        end
        @is_at_all = argv.flag?('all', false)
        super
      end

      def validate!
        super
        help! 'A message content is required.' unless @content
      end

      def run
        res = DingTalk::HttpHelper.send_text(@content, @at_mobiles, @is_at_all, @token, @secret)
        puts res.bold.green
      end

    end
  end
end
