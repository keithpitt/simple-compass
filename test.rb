require "rubygems"
require "bundler/setup"
require "sass"

options = { :load_paths => [ Sass::Importers::Filesystem.new("sass") ] }
engine = ::Sass::Engine.new File.read("test/fixtures/opacity_test.sass"), options
p engine.to_css
