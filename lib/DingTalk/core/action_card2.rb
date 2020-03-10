module DingTalk
  module Message
    # 消息类型及数据格式 - 独立跳转ActionCard类型
     #    {
     #      "actionCard": {
     #        "title": "乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身",
     #        "text": "![screenshot](@lADOpwk3K80C0M0FoA)
     # ### 乔布斯 20 年前想打造的苹果咖啡厅
     # Apple Store 的设计正从原来满满的科技感走向生活化，而其生活化的走向其实可以追溯到 20 年前苹果一个建立咖啡馆的计划",
     #        "hideAvatar": "0",
     #        "btnOrientation": "0",
     #        "btns": [
     #          {
     #            "title": "内容不错",
     #            "actionURL": "https://www.dingtalk.com/"
     #          },
     #          {
     #            "title": "不感兴趣",
     #            "actionURL": "https://www.dingtalk.com/"
     #          }
     #        ]
     #      },
     #      "msgtype": "actionCard"
     #    }
    class ActionCard2 < BaseMessage

      attr_accessor :title, :text, :btns, :btn_orientation, :hide_avatar

      def initialize(title, text, buttons, btn_orientation = '0', hide_avatar = '0')
        @title = title # 首屏会话透出的展示内容
        @text = text # markdown格式的消息
        @buttons = buttons # 按钮的信息：title-按钮方案，actionURL-点击按钮触发的URL
        @btn_orientation = btn_orientation # 0-按钮竖直排列，1-按钮横向排列
        @hide_avatar = hide_avatar # 0-正常发消息者头像，1-隐藏发消息者头像
      end

      def message_type
        TYPE::ACTION_CARD # 此消息类型为固定actionCard
      end

      def build_message
        super.merge(
          {
            :actionCard => {
              :title => @title,
              :text => @text,
              :btns => @buttons.map { | button | button.build_message },
              :btnOrientation => @btn_orientation,
              :hideAvatar => @hide_avatar
            }
          }
        )
      end
    end

    class ActionCard2Button

      attr_accessor :title, :action_url

      def initialize(title, action_url)
        @title = title # 按钮方案
        @action_url = action_url # 点击按钮触发的URL
      end

      def build_message
        { :title => @title, :actionURL => @action_url }
      end
    end
  end
end
