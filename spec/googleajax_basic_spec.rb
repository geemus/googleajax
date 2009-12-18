require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/googleajax_common')

require 'googleajax/basic'

describe "GoogleAjax (basic)" do
  it "returns results as an unaltered hash" do
    GoogleAjax.referer = "http://example.com"
    response = GoogleAjax::Search.web("apple", :rsz => :large)
    response.should be_kind_of(Hash)
    response['cursor'].should be_an_instance_of(Hash)
  end
end