require "rubygems"
require "bundler/setup"

require "sass"
require "simple-compass"

engine = ::Sass::Engine.new File.read("test/fixtures/opacity_test.sass")
p engine.to_css
