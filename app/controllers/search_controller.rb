class SearchController < ApplicationController

    def index
        @lists = List.search(params[:search]).order(created_at: :desc)
    end
end
