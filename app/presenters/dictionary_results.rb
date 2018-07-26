class DictionaryResults
  def self.return_parsed_response(word)
    OxfordService.new.parsed_response(word).map do |element|
      SentenceService.new(element)
    end
  end
end