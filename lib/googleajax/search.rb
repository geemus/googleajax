class GoogleAjax
  class Search
    SEARCH_VERSION = 1.0
    def self.get(method, query, args = {})
      args = { :v => SEARCH_VERSION }.merge!(args)
      GoogleAjax::get(:search, method, query, args)
    end
  
    def self.blogs(query, args = {})
      self.get(:blogs, query, args)
    end
  
    def self.books(query, args = {})
      self.get(:books, query, args)
    end
  
    def self.images(query, args = {})
      self.get(:images, query, args)
    end
  
    def self.local(query, latitude, longitude, args = {})
      args = { :sll => "#{latitude},#{longitude}" }.merge!(args)
      self.get(:local, query, args)
    end

    def self.news(query, args = {})
      self.get(:news, query, args)
    end
  
    def self.video(query, args = {})
      self.get(:video, query, args)
    end
  
    def self.web(query, args = {})
      self.get(:web, query, args)
    end
  
    class Results < OpenStruct
      def initialize(data)
        super(data)                
        self.results = results.collect {|data| Result.new(data)}
        self.cursor = Cursor.new(cursor) if self.cursor
      end
    
      def count
        self.cursor.estimatedResultCount
      end
    end
  
    class Result < OpenStruct
      def initialize(data)
        super(data)
      end
    end
  
    class Cursor < OpenStruct
      def initialize(data)
        super(data)
        self.pages = pages.collect {|data| Page.new(data)}
      end
    end
  
    class Page < OpenStruct
      def initialize(data)
        super(data)
      end
    end      
  end
end