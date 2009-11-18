# Include this file instead of googleajax so that results are simply hashes

module GoogleAjax
  class Base < Hash
    def initialize(h)
      super()
      replace(h)
    end

    def self.remap(h)
    end
  end
end

require 'googleajax'
