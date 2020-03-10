[![Build Status](https://travis-ci.com/iospai/dingtalk.svg?branch=master)](https://travis-ci.com/iospai/dingtalk)

# DingTalk

群机器人是钉钉群的高级扩展功能。群机器人可以将第三方服务的信息聚合到群聊中，实现自动化的信息同步。目前，大部分机器人在添加后，还需要进行Webhook配置，才可正常使用(配置说明详见操作流程中的帮助链接)。

例如：
通过聚合GitHub，GitLab等源码管理服务，实现源码更新同步。
通过聚合Trello，JIRA等项目协调服务，实现项目信息同步。

另外，群机器人支持Webhook协议的自定义接入，支持更多可能性，例如：你可将运维报警通过自定义机器人聚合到钉钉群实现提醒功能。

[前往详细文档](https://ding-doc.dingtalk.com/doc#/serverapi2/krgddi)
## 安装

添加下面代码到您的应用工程的`Gemfile`文件：

```ruby
gem 'dingtalk-cli'
```

然后执行：

    $ bundle install

或者，通过下面命令安装，可以运行可执行文件`dingtalk`

    $ gem install dingtalk-cli

## 使用

```shell script
Usage:

    $ dingtalk COMMAND

      自定义钉钉群机器人 DingTalk for CLI

Commands:

    + action-card      发送整体跳转ActionCard类型消息
    + feed-card        发送FeedCard类型消息
    + link             发送link类型消息
    + markdown         发送link类型消息
    + text             发送text类型消息

Options:

    --token=`token`    自定义机器人access_token
    --secret=`secret`   自定义机器人加签密钥
    --version          Show the version of the tool
    --verbose          Show more debugging information
    --no-ansi          Show output without ANSI codes
    --help             Show help banner of specified command
```
其中，`token`和`secret`有以下三种配置方式
#### 方式一、参数配置
通过`--token`和`--secret`拼接的方式配置。

#### 方式二、临时环境变量配置
直接执行，`DINGTALK_TOKEN="xxxxxxx" DINGTALK_SECRET="xxxxxxx" dingtalk ` + 其他配置

#### 方式三、全局环境变量配置
配置在`~/.bash_profile`文件。
```shell script
echo 'export DINGTALK_TOKEN="xxxxxxx"' >> ~/.bash_profile; 
echo 'export DINGTALK_SECRET="xxxxxxx"' >> ~/.bash_profile; 
source ~/.bash_profile
```

> 说明：配置的优先级为：参数配置 > 临时环境变量配置 > 全局环境变量配置
## 开发

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## 贡献

Bug reports and pull requests are welcome on GitHub at https://github.com/iospai/dingtalk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/iospai/DingTalk/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DingTalk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/iospai/DingTalk/blob/master/CODE_OF_CONDUCT.md).
