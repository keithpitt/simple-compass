require "sass"
require "simple-compass"

def read_fixture(name)
  file = File.join File.expand_path('../fixtures/', __FILE__), name
  File.read file
end
