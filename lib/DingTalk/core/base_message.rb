

module DingTalk
  module Message
    module TYPE
      TEXT = 'text'.freeze
      LINK = 'link'.freeze
      MARKDOWN = 'markdown'.freeze
      ACTION_CARD = 'actionCard'.freeze # 整体跳转ActionCard类型
      ACTION_CARD2 = 'actionCard'.freeze # 独立跳转ActionCard类型
      FEED_CARD = 'feedCard'.freeze
    end

    # 消息 BaseMessage 类
    class BaseMessage

      def message_type
        # implement in child
      end

      def build_message
        {
          :msgtype => message_type
        }
      end

      def to_json
        build_message.to_json
      end

    end
  end
end
