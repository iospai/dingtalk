require "bundler/setup"
require "DingTalk"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def run_cli(exec = './bin/dingtalk', input)
    cmd = %Q(echo \'#{input}\'|bundle exec #{exec})
    output = Open3.popen3(cmd) {|stdin, stdout, stderr, wait_thr| stdout.read }
  end
end
