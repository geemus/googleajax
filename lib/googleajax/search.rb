module GoogleAjax
  class Search < Results
    # A shortcut to the estimated result count
    # e.g. GoogleAjax.books("Iliad").count  # => 60000
    def count
      self[:cursor][:estimated_result_count]
    end

    ##
    # :call-seq:
    #   local(query, args = {})
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_local
    def self.local(query, latitude, longitude, args = {})
      args = { :sll => "#{latitude},#{longitude}" }.merge(args)
      get(:local, query, args)
    end

    ##
    # :call-seq:
    #   blogs(query, args = {})
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_blog
  
    ##
    # :call-seq:
    #   books(query, args = {})
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_book

    ##
    # :call-seq:
    #   images(query, args = {})
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_image

    ##
    # :call-seq:
    #   news(query, args = {})
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_news
    # Contrary to the doc, scoring=d is not an acceptable parameter (nor is scoring=date)

    ##
    # :call-seq:
    #   video(query, args = {})
    # Arguments: http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_video

    ##
    # :call-seq:
    #   web(query, args = {})
    # http://code.google.com/apis/ajaxsearch/documentation/reference.html#_fonje_web

    standard_api :blogs, :books, :images, :news, :video, :web
  end
end