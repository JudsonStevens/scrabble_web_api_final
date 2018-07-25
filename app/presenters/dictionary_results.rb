class DictionaryResults
  attr_reader :region, :text
  def initialize(region, text)
    @region = region
    @text = text
  end
end