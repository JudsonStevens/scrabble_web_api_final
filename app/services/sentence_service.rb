class SentenceService
  attr_reader :region, :text
  def initialize(entry)
    @region = entry[0]
    @text = entry[1]
  end
end