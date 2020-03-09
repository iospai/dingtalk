module DingTalk
  module Message
    # 消息类型及数据格式 - FeedCard类型
    # {
    #   "feedCard": {
    #     "links": [
    #       {
    #         "title": "时代的火车向前开",
    #         "messageURL": "https://www.dingtalk.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI",
    #         "picURL": "https://www.dingtalk.com/"
    #       },
    #       {
    #         "title": "时代的火车向前开2",
    #         "messageURL": "https://www.dingtalk.com/s?__biz=MzA4NjMwMTA2Ng==&mid=2650316842&idx=1&sn=60da3ea2b29f1dcc43a7c8e4a7c97a16&scene=2&srcid=09189AnRJEdIiWVaKltFzNTw&from=timeline&isappinstalled=0&key=&ascene=2&uin=&devicetype=android-23&version=26031933&nettype=WIFI",
    #         "picURL": "https://www.dingtalk.com/"
    #       }
    #     ]
    #   },
    #   "msgtype": "feedCard"
    # }
    class FeedCard < BaseMessage

      attr_accessor :links

      def initialize(links)
        @links = links
      end

      def message_type
        TYPE::FEED_CARD # 此消息类型为固定feedCard
      end

      def build_message
        super.merge do
          {
            :feedCard => {
              :links => @links.map { | link | link.build_message }
            }
          }
        end
      end
    end

    # FeedCard跳转链接
    class FeedCardLink

      attr_accessor :title, :pic_url, :message_url

      def initialize(title='', pic_url='', message_url='')
        @title = title
        @pic_url = pic_url
        @message_url = message_url
      end

      def build_message
        {
          :title => @title, # 单条信息文本
          :messageURL => @message_url, # 点击单条信息到跳转链接
          :picURL => @pic_url # 单条信息后面图片的URL
        }
      end

    end
  end
end
