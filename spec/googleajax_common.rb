# encoding:utf-8
shared_examples_for "GoogleAjax" do
  it "requires a referer" do
    GoogleAjax.referer = nil
    lambda{GoogleAjax::Search.web("testing")}.should raise_error
  end

  describe "::Search" do
    describe ".web" do
      before :each do
        GoogleAjax.referer = "http://example.com"
        @response = GoogleAjax::Search.web("apple", :rsz => :large)
      end

      it "returns the expected results" do
        @response[:results].select{|result| result[:url] =~ /http:(.*).apple.com/}.size.should >= 4
      end
    end

    describe ".news" do
      before :each do
        GoogleAjax.referer = "http://example.com"
      end

      it "returns fresh news" do
        one_day = 24 * 60 * 60
        yesterday = Time.now - one_day
        results = GoogleAjax::Search.news("", :topic => :h)[:results]
        results.size.should >= 4
        results.all?{|r| r[:published_date].should >= yesterday}
      end
    end

    {
      :blogs  => 100_000,
      :books  => 10_000,
      :images => 10_000,
      :video  => 10_000,
      :web    => 1_000_000,
      :local  => [100, 48.8565, 2.3509]
    }.each do |method, (min, *args)|
      describe ".#{method}" do
        before :each do
          GoogleAjax.referer = "http://example.com"
          @response_small = GoogleAjax::Search.send(method, "ruby", *args)
        end

        it "takes options into account" do
          @response_large = GoogleAjax::Search.send(method, "ruby", *(args+[{:rsz => :large}]))
          @response_large[:results].size.should > @response_small[:results].size
        end unless method == :blogs # Google doesn't seem to support this option for blogs???

        it "returns an approximate count of hits" do
          @response_small.count.should > min
        end
      end
    end
  end

  describe "::Language" do
    before :each do
      GoogleAjax.referer = "http://example.com"
    end

    describe ".detect" do
      it "returns the right language" do
        GoogleAjax::Language.detect("What's up folks")[:language].should == "en"
        GoogleAjax::Language.detect("Montréal est une ville incroyable")[:language].should == "fr"
      end

      it "converts nicely the return types" do
        result = GoogleAjax::Language.detect("Sandwich")
        result[:is_reliable].should == false
        result[:confidence].should be_a(Numeric)
      end
    end

    describe ".translate" do
      it "does an approximate translation" do
        GoogleAjax::Language.translate("Ruby rocks", "en", "fr")[:translated_text].should == "Ruby roches"
      end

      it "translates texts longer than the 2k limit on get requets" do
        GoogleAjax::Language.translate("Ruby rocks. "*250, "en", "fr")[:translated_text].count("Ruby").should == 1000
      end
    end
  end

  describe "::Feed" do
    before :each do
      GoogleAjax.referer = "http://example.com"
    end

    describe ".find" do
      it "returns the right feeds" do
        feeds = GoogleAjax::Feed.find("Ruby")
        feeds.size.should == 10
        feeds.map{|f| f[:url]}.should include "http://www.ruby-lang.org/en/feeds/news.rss"
      end
    end

    describe ".load" do
      it "loads entries of a feed" do
        feed = GoogleAjax::Feed.load('http://digg.com/rss/index.xml')
        feed[:title].should == "digg.com: Stories / Popular"
        feed[:entries].size.should == 4
      end
    end

    describe ".lookup" do
      it "returns the feed associated with a URL" do
        feed = GoogleAjax::Feed.lookup("http://digg.com/")
        feed[:url].should == "http://feeds.digg.com/digg/popular.rss"
      end
    end
  end
end
