class String
  # Standard in rails. See official documentation[http://api.rubyonrails.org/classes/ActiveSupport/CoreExtensions/String/Inflections.html]
  def underscore
    gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end unless method_defined? :underscore

  # Standard in rails. See official documentation[http://api.rubyonrails.org/classes/ActiveSupport/CoreExtensions/String/Inflections.html]
  def demodulize
    gsub(/^.*::/, '')
  end unless method_defined? :demodulize
end