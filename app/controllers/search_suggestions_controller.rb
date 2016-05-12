class SearchSuggestionsController < ApplicationController
	def index
		@results = Refinery::Terms::Term.search( conditions: { title: Riddle::Query.escape(params[:term])}, star: true, limit: 10)
		terms = @results.map do |term|
			{label: term.title, value: refinery.terms_term_path(term)}
		end
		render json: terms
	end
end
