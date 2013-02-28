require 'rubygems'
require "bundler/setup"
require "sass"

module SimpleCompass
  class Importer < Sass::Importers::Base
    def find(name, context = nil)
      if name =~ /simple_compass\//
        Sass::Engine.new(File.read("sass/simple_compass.sass"), :filename => name, :importer => self)
      end
    end

    def key(name, context)
      [self.class.name, name]
    end

    def to_s
      "simple_compass"
    end
  end
end

module Sass::Script::Functions
  def legacy_support_for_ie6
    false
  end
  def legacy_support_for_ie7
    false
  end
  def legacy_support_for_ie8
    false
  end
end

options = { :load_paths => [ Sass::Importers::Filesystem.new("sass") ] }
engine = ::Sass::Engine.new File.read("test/fixtures/opacity_test.sass"), options
p engine.environment


p engine.to_css
