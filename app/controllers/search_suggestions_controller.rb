class SearchSuggestionsController < ApplicationController
  def index
    render json: SearchSuggestions.terms_for(params[:term])
  end
end
