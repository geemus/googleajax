require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/googleajax_common')

require 'googleajax'

describe "GoogleAjax (standard)" do
  it_should_behave_like "GoogleAjax"

  it "returns results as an OpenStuct" do
    GoogleAjax.referer = "http://example.com"
    response = GoogleAjax::Search.web("apple", :rsz => :large)
    response.is_a? OpenStruct
    response.cursor.is_a? OpenStruct
  end
end