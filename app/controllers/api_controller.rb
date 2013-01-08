class ApiController < ApplicationController
    GOOGLE_API_KEY = 'AIzaSyCiIBHvZF9FQphXsAaQrvUkoKNYWkIrP0o';
    before_filter :require_user
    
    def index
      if params[:name]
            # venues is a hash, with keys that represents different type of results
            # see "Response Fields" in this page: https://developer.foursquare.com/docs/venues/search.html
            # for more details
            @venues = foursquare.venues.nearby(:query => params[:name], :ll => "48.857,2.349")
      end
    end
    
    def show
    end
    
    def user
    end
end