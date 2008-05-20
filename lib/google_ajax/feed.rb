class GoogleAjax
  class Feed
    FEED_VERSION = 1.0
    def self.get(method, query, args = {})
      args = { :v => FEED_VERSION }.merge!(args)
      GoogleAjax::get(:feed, method, query, args)
    end
    
    # will return a list of feeds that match the given query
    def self.find(query, args = {})
      self.get(:find, query)
    end

    # downloads this feed from Google's servers
    # Optional: args { :num => number of entries to download(default is 4, maximum is 100) }
    def self.load(query, args = {})
      self.get(:load, query, args)
    end
    
    # will return the associated feed if it exists for a given url    
    def self.lookup(query, args = {})
      self.get(:lookup, query)
    end    
    
    class Entry < OpenStruct
      def initialize(data)
        super(data)
      end
    end    
    
    class Feed < OpenStruct
      def initialize(data)
        super(data)
        self.entries = entries.collect {|data| Entry.new(data)} if entries
      end
    end
  end
end