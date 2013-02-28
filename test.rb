require 'rubygems'
require "bundler/setup"
require "sass"

module SimpleCompass
  class Importer < Sass::Importers::Base
    def find(name, context = nil)
      if name =~ /simple_compass\//
        Sass::Engine.new("", :filename => name, :importer => self)
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

options = { :load_paths => [ SimpleCompass::Importer.new ] }
engine = ::Sass::Engine.new File.read("stylesheets/test.sass"), options
p engine.to_css
