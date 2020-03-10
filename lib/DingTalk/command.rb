require 'claide'

module DingTalk
  class Command < CLAide::Command
    require 'DingTalk/command/text'

    self.abstract_command = true
    self.command = 'dingtalk'
    self.version = DingTalk::VERSION
    self.description = '自定义钉钉群机器人 DingTalk for CLI'

    def run
      p '开始执行 DingTalk for CLI'
    end
  end
end
