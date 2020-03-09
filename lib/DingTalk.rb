require "DingTalk/version"

module DingTalk
  class Error < StandardError; end
  # Your code goes here...
  autoload :Command,  'DingTalk/command'
end
