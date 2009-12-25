module GoogleAjax
  class Feed < Results
    ##
    # :call-seq:
    #   find(query, args = {})
    # will return a list of feeds that match the given query
    # Arguments: http://code.google.com/apis/ajaxfeeds/documentation/reference.html#_fonje_find
    standard_api(:find){|h| h['entries']}

    ##
    # :call-seq:
    #   load(url, args = {})
    # downloads this feed from Google's servers
    # Arguments: http://code.google.com/apis/ajaxfeeds/documentation/reference.html#_fonje_load
    standard_api(:load){|h| h['feed']}

    ##
    # :call-seq:
    #   lookup(url, args = {})
    # will return the associated feed if it exists for a given url    
    # Arguments: http://code.google.com/apis/ajaxfeeds/documentation/reference.html#_intro_fonje
    standard_api :lookup
  end
end