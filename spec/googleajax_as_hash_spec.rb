require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/googleajax_common')

require 'googleajax/as_hash'

describe "GoogleAjax/as_hash" do
  it_should_behave_like "GoogleAjax"

  it "returns results as a hash" do
    GoogleAjax.referer = "http://example.com"
    response = GoogleAjax::Search.web("apple", :rsz => :large)
    response.is_a? Hash
    response['cursor'].is_a? Hash
  end
end