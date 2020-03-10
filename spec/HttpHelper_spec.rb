require 'rspec'

require_relative '../lib/DingTalk/utils/http_helper'
require_relative '../lib/DingTalk/core/text'

RSpec.describe 'HttpHelper unit test' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context 'when condition' do
    it '测试网络请求' do
      message = DingTalk::Message::Text.new('[DT] 我就是我, 是不一样的烟火')
      res = DingTalk::HttpHelper.send_http(message.build_message)
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end

    it '测试 text 类型' do
      res = DingTalk::HttpHelper.send_text('[DT] 我就是我, 是不一样的烟火', [18616316816], false )
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end

    it '测试 link 类型' do
      content = %Q(这个即将发布的新版本，创始人xx称它为“红树林”。
而在此之前，每当面临重大升级，产品经理们都会取一个应景的代号，这一次，为什么是“红树林”？)
      url = 'https://www.dingtalk.com'
      res = DingTalk::HttpHelper.send_link('[DT] 时代的火车向前开', content, '', url)
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end

    it '测试 markdown 类型' do
      content = %Q(
    #### 杭州天气 @156xxxx8827\n
    > 9度，西北风1级，空气良89，相对温度73%\n\n
    > ![screenshot](https://gw.alicdn.com/tfs/TB1ut3xxbsrBKNjSZFpXXcXhFXa-846-786.png)\n
    > ###### 10点20分发布 [天气](http://www.thinkpage.cn/) \n
      )
      res = DingTalk::HttpHelper.send_markdown('[DT] 杭州天气', content, [18616316816], false )
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end

    it '测试 整体跳转ActionCard 类型' do
      title = '[DT] 乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身'
      content = %Q(
![screenshot](@lADOpwk3K80C0M0FoA)
 ### 乔布斯 20 年前想打造的苹果咖啡厅
 Apple Store 的设计正从原来满满的科技感走向生活化，而其生活化的走向其实可以追溯到 20 年前苹果一个建立咖啡馆的计划
      )
      res = DingTalk::HttpHelper.send_action_card(title, content, '阅读全文', 'https://www.dingtalk.com/' )
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end

    it '测试 独立跳转ActionCard 类型' do
      title = '[DT] 乔布斯 20 年前想打造一间苹果咖啡厅，而它正是 Apple Store 的前身'
      content = %Q(
![screenshot](@lADOpwk3K80C0M0FoA)
 ### 乔布斯 20 年前想打造的苹果咖啡厅
 Apple Store 的设计正从原来满满的科技感走向生活化，而其生活化的走向其实可以追溯到 20 年前苹果一个建立咖啡馆的计划
      )
      buttons = [
        DingTalk::Message::ActionCard2Button.new('内容不错', 'https://www.dingtalk.com/'),
        DingTalk::Message::ActionCard2Button.new('不感兴趣', 'https://www.dingtalk.com/')
      ]
      res = DingTalk::HttpHelper.send_action_card2(title, content, buttons )
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end

    it '测试 FeedCard 类型' do
      links = [
        DingTalk::Message::FeedCardLink.new('[DT] 时代的火车向前开', 'https://www.dingtalk.com/', 'https://www.dingtalk.com/'),
        DingTalk::Message::FeedCardLink.new('[DT] 时代的火车向前开2', 'https://www.dingtalk.com/', 'https://www.dingtalk.com/')
      ]
      res = DingTalk::HttpHelper.send_feed_card(links)
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end

  end
end
