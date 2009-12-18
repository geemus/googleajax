module GoogleAjax
  # Out very own Hash class, with the only difference being the constructor
  # which takes a hash for its initial values
  class Hash < ::Hash
    def initialize(h)
      replace(h)
      super()
    end
  end
end