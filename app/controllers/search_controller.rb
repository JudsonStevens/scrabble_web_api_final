class SearchController < ApplicationController
  def index
    @word = params[:q]
    @results = DictionaryResults.return_parsed_response(@word)
  end
end
