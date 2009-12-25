module GoogleAjax
  # The Results class is the superclass for the results of API calls and acts as a Hash.
  # Instance methods can be added to add functionalities (e.g. Search#count)
  # Class methods are the actual api calls.
  #
  # For example the Search api inherits from Results.
  # GoogleAjax::Search.web will return an instance of GoogleAjax::Search
  # Some of the values within this GoogleAjax::Search instance will also
  # act as hashes. They will be instances of GoogleAjax::Base and so will
  # be their values that act as hashes.
  class Results < Base
    extend API
  end
end