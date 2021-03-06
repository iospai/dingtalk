require 'open3'
require_relative 'lib/DingTalk/version'

Gem::Specification.new do |spec|
  spec.name          = "dingtalk-cli"
  spec.version       = DingTalk::VERSION
  spec.authors       = ["大龙侠"]
  spec.email         = ["396804688@qq.com"]

  spec.summary       = %q{自定义钉钉群机器人}
  spec.description   = %q{自定义钉钉群机器人 dingtalk-cli}
  spec.homepage      = "https://ding-doc.dingtalk.com/"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/iospai/dingtalk.git"
  spec.metadata["changelog_uri"] = "https://raw.githubusercontent.com/iospai/dingtalk/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
