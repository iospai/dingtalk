require_relative 'lib/DingTalk/version'

Gem::Specification.new do |spec|
  spec.name          = "dingtalk-cli"
  spec.version       = DingTalk::VERSION
  spec.authors       = ["大龙侠"]
  spec.email         = ["396804688@qq.com"]

  spec.summary       = %q{钉钉群机器人 DingTalk-CLI}
  spec.description   = %q{群机器人是钉钉群的高级扩展功能。群机器人可以将第三方服务的信息聚合到群聊中，实现自动化的信息同步。目前，大部分机器人在添加后，还需要进行Webhook配置，才可正常使用(配置说明详见操作流程中的帮助链接)。https://ding-doc.dingtalk.com/doc#/serverapi2/krgddi}
  spec.homepage      = "https://ding-doc.dingtalk.com/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iospai/dingtalk.git"
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
