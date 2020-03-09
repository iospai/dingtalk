require 'claide'

module DingTalk
    class Command < CLAide::Command
        # self.ababstract_command = true
        self.command = 'dingtalk'
        self.version = DingTalk::VERSION
        self.description = '自定义钉钉群机器人 DingTalk for CLI'

        def run
            p 'Ok'
        end
    end
end