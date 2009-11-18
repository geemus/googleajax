module GoogleAjax
  module Feed
    FEED_VERSION = 1.0
    # Arguments: http://code.google.com/apis/ajaxfeeds/documentation/reference.html#_intro_fonje
    def self.get(method, query, args)
      args = { :v => FEED_VERSION }.merge(args)
      GoogleAjax::get(:feed, method, query, args)
    end

    # will return a list of feeds that match the given query
    # Arguments: http://code.google.com/apis/ajaxfeeds/documentation/reference.html#_fonje_find
    def self.find(query, args = {})
      self.get(:find, query, args)
    end

    # downloads this feed from Google's servers
    # Arguments: http://code.google.com/apis/ajaxfeeds/documentation/reference.html#_fonje_load
    def self.load(url, args = {})
      self.get(:load, url, args)
    end

    # will return the associated feed if it exists for a given url    
    # Arguments: http://code.google.com/apis/ajaxfeeds/documentation/reference.html#_intro_fonje
    def self.lookup(url, args = {})
      self.get(:lookup, url, args)
    end    

    class Entry < Base
    end    

    class Feed < Base
      remap :entries => Entry
    end
  end
end