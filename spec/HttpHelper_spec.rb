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
      # message = DingTalk::Message.Text.new('DevOps 我就是我, 是不一样的烟火')
      p '***************************'
      p DingTalk::Message.Text
      message = DingTalk::Message.Text.new
      res = DingTalk::HttpHelper.send_http(message.build_message)
      expect(res).to eq({:errcode => 0, :errmsg => 'ok'}.to_json)
    end
  end
end
