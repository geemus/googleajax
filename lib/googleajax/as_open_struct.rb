# If you prefer getting back OpenStructs instead of Hashes,
# then require 'googleajax/as_open_struct' *instead* of 'googleajax'

# These OpenStruct will also have the [] and []= operators defined
require 'ostruct'
require 'googleajax/filters'
module GoogleAjax
  class Base < ::OpenStruct
    include Filters::Default

    def [](key)
      send(key)
    end

    def []=(key, value)
      send("#{key}=", value)
    end
  end
end
require 'googleajax'
