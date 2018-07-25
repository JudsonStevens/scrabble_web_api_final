class OxfordService

  def initialize
    @conn = Faraday.new(:url => "https://od-api.oxforddictionaries.com")
  end

  def send_request_for_word_search_with_examples(word)
    @conn.get do |req|
      req.url "/api/v1/entries/en/#{word}/sentences"
      req.headers['Accept'] = 'application/json'
      req.headers['app_id'] = ENV['APP_ID']
      req.headers['app_key'] = ENV['APP_KEY']
    end
  end

  def return_parsed_response(word)
    parsed_results = JSON.parse(send_request_for_word_search_with_examples(word).body)['results'].first['lexicalEntries'].first['sentences']  
    parsed_results.map do |result|
      if result['regions'].first == 'North American'
        [result['regions'].first, result['text']]
      end
    end.compact
  end
end