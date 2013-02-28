require 'rubygems'
require "bundler/setup"
require "sass"

class SimpleCompass < Sass::Importers::Base
  def initialize(root)
    raise 'root'
  end
end

engine = ::Sass::Engine.new File.read("stylesheets/test.sass")
p engine.to_css
