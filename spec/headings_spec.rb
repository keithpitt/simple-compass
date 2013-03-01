require 'spec_helper'

describe "\#{headings}" do
  it "allows you to create styles for all the headers" do

    engine = ::Sass::Engine.new read_fixture("headings_test.sass")
    engine.to_css.should =~ /h1, h2, h3, h4, h5, h6/
  end
end
