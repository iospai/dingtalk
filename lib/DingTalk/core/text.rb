require_relative './base_message'

module DingTalk
  module Message
    # 消息类型及数据格式 - text类型
    # {
    #   "msgtype": "text",
    #   "text": {
    #     "content": "我就是我, 是不一样的烟火@156xxxx8827"
    #   },
    #   "at": {
    #     "atMobiles": [
    #       "156xxxx8827",
    #       "189xxxx8325"
    #     ],
    #     "isAtAll": false
    #   }
    # }
    class Text < BaseMessage

      attr_accessor :content, :at_mobiles, :is_at_all

      def initialize(content, at_mobiles = [], is_at_all = false)
        @content = content # 消息内容
        @at_mobiles = at_mobiles # 被@人的手机号(在content里添加@人的手机号)
        @is_at_all = is_at_all # @所有人时：true，否则为：false
      end

      def message_type
        TYPE::TEXT # 消息类型，此时固定为：text
      end

      def build_message
        super.merge do
          {
            :text => {
              :content => @content
            },
            :at => {
              :atMobiles => @at_mobiles,
              :isAtAll => @is_at_all
            }
          }
        end
      end
    end
  end
end
