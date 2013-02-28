require 'spec_helper'

describe "@include opacity()" do
  it "renders the opacity flag" do

    engine = ::Sass::Engine.new read_fixture("opacity_test.sass")
    engine.to_css.should =~ /opacity: 5/
  end
end
