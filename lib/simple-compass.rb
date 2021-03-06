require 'sass'

module Compass
  module Frameworks
    def self.register(name, options = {})
      Sass.load_paths << options[:stylesheets_directory]
    end
  end
end

root_dir = File.join(File.dirname(__FILE__), '..')

sass_dir = File.expand_path File.join root_dir, 'sass'
Sass.load_paths << sass_dir

functions_dir = File.expand_path File.join root_dir, 'lib', 'simple-compass', 'sass', 'functions'
Dir[File.join(functions_dir, "**/*.rb")].each { |f| require f }
