module DingTalk
  module Message
    # 消息类型及数据格式 - markdown类型
    # {
    #   "msgtype": "markdown",
    #   "markdown": {
    #     "title":"杭州天气",
    #     "text": "#### 杭州天气 @156xxxx8827\n" +
    #       "> 9度，西北风1级，空气良89，相对温度73%\n\n" +
    #       "> ![screenshot](https://gw.alicdn.com/tfs/TB1ut3xxbsrBKNjSZFpXXcXhFXa-846-786.png)\n"  +
    #       "> ###### 10点20分发布 [天气](http://www.thinkpage.cn/) \n"
    #   },
    #   "at": {
    #     "atMobiles": [
    #       "156xxxx8827",
    #       "189xxxx8325"
    #     ],
    #     "isAtAll": false
    #   }
    # }
    class Markdown < BaseMessage

      attr_accessor :title, :text, :at_mobiles, :is_at_all

      def initialize(title, text, at_mobiles = [], is_at_all = false)
        @title = title # 首屏会话透出的展示内容
        @text = text # markdown格式的消息
        @at_mobiles = at_mobiles # 被@人的手机号(在text内容里要有@手机号)
        @is_at_all = is_at_all # @所有人时：true，否则为：false
      end

      def message_type
        TYPE::MARKDOWN # 此消息类型为固定markdown
      end

      def build_message
        super.merge do
          {
            :markdown => {
              :title => @title,
              :text => @text
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
