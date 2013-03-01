require 'spec_helper'

describe "@import compass/reset" do
  it "includes the reset code" do

    engine = ::Sass::Engine.new read_fixture("reset_test.sass")
    engine.to_css.should =~ /margin: 0;/
  end
end
