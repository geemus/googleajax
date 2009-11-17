module GoogleAjax
  module Search
    SEARCH_VERSION = 1.0
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_web
    def self.get(method, query, args)
      args = { :v => SEARCH_VERSION }.merge(args)
      GoogleAjax::get(:search, method, query, args)
    end
  
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_blog
    def self.blogs(query, args = {})
      self.get(:blogs, query, args)
    end
  
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_book
    def self.books(query, args = {})
      self.get(:books, query, args)
    end

    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_image
    def self.images(query, args = {})
      self.get(:images, query, args)
    end

    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_local
    def self.local(query, latitude, longitude, args = {})
      args = { :sll => "#{latitude},#{longitude}" }.merge(args)
      self.get(:local, query, args)
    end

    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_news
    def self.news(query, args = {})
      self.get(:news, query, args)
    end

    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_video
    def self.video(query, args = {})
      self.get(:video, query, args)
    end

    # http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_web
    def self.web(query, args = {})
      self.get(:web, query, args)
    end

    class Result < Base
    end

    class Page < Base
    end

    class Cursor < Base
      remap :pages => Page
    end

    class Results < Base
      remap :results => Result,
            :cursor => Cursor

      def count
        self['cursor']['estimatedResultCount'].to_i
      end
    end

  end
end