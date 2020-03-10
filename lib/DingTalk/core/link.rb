module DingTalk
  module Message
    # 消息类型及数据格式 - link类型
    #     {
    #       "msgtype": "link",
    #       "link": {
    #         "text": "这个即将发布的新版本，创始人xx称它为“红树林”。
    # 而在此之前，每当面临重大升级，产品经理们都会取一个应景的代号，这一次，为什么是“红树林”？",
    #         "title": "时代的火车向前开",
    #         "picUrl": "",
    #         "messageUrl": "https://www.dingtalk.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI"
    #       }
    #     }
    class Link < BaseMessage

      attr_accessor :title, :text, :pic_url, :message_url

      def initialize(title, text, pic_url, message_url = '')
        @title = title # 消息标题
        @text = text # 消息内容。如果太长只会部分展示
        @pic_url = pic_url # 图片URL
        @message_url = message_url # 点击消息跳转的URL
      end

      def message_type
        TYPE::LINK # 消息类型，此时固定为：link
      end

      def build_message
        super.merge(
          {
            :link => {
              :title => @title,
              :text => @text,
              :picUrl => @pic_url,
              :messageUrl => @message_url,
            }
          }
        )
      end
    end
  end
end
