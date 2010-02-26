module GoogleAjax
  module Request
    HOST = 'ajax.googleapis.com'
    PATH_PREFIX = "/ajax/services/"
    attr_accessor :api_key
    attr_accessor :referer
    alias_method :referrer, :referer  # See mispelling section in http://en.wikipedia.org/wiki/HTTP_referrer
    alias_method :referrer=, :referer=

    # Api doc is at http://code.google.com/apis/ajaxsearch/documentation/reference.html#_intro_fonje
    # We use one special option (not forwarded to google):  :html_method => :post will use a Post instead of a Get.
    def get(api, method, query, args = nil)
      raise "You must assign a value to GoogleAjax.referer" unless referer
      args ||= {}
      use_post = args.delete(:http_method) == :post
      args = args.merge!('q' => query)
      args['key'] = api_key if api_key
      if use_post
        request = Net::HTTP::Post.new("#{PATH_PREFIX}#{api}/#{method}", "Referer" => referer)
        request.set_form_data(args)
      else
        request = Net::HTTP::Get.new("#{PATH_PREFIX}#{api}/#{method}?" + args.map{|k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join("&"), "Referer" => referer)
      end
      Net::HTTP.new(HOST).start do |http|
        http.request(request).body
      end
    end
  end
end
