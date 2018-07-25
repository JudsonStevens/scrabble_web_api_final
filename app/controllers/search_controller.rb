class SearchController < ApplicationController
  def index
    @word = params[:q]
    @results = OxfordService.new.return_parsed_response(@word)
  end
end
