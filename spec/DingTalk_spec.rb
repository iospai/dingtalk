RSpec.describe DingTalk do
  it "has a version number" do
    expect(DingTalk::VERSION).not_to be nil
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end

  it "发送一个文本消息" do
    message = '这是一条测试消息，来自 dingtalk-cli。'
    cli_output = run_cli('./bin/dingtalk', message)
    expect(cli_output).to eq("11\n")
  end
end
