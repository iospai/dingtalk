require 'claide'

module DingTalk
  class Command < CLAide::Command

    require 'DingTalk/command/text'
    require 'DingTalk/command/link'
    require 'DingTalk/command/markdown'
    require 'DingTalk/command/action_card'
    require 'DingTalk/command/feed_card'

    self.abstract_command = true
    self.command = 'dingtalk'
    self.version = DingTalk::VERSION
    self.description = '自定义钉钉群机器人 DingTalk for CLI'

    def self.options
      [
        %w(--token=`token` 自定义机器人access_token),
      ].concat(super)
    end

    def initialize(argv)
      @token = argv.option('token')
      super
    end

    def run
      # puts '开始执行 DingTalk for CLI'
    end
  end
end
