class ApiController < ApplicationController
    GOOGLE_API_KEY = 'AIzaSyCiIBHvZF9FQphXsAaQrvUkoKNYWkIrP0o';
    before_filter :require_user
    
    def index
      if params[:name]
            # venues is a hash, with keys that represents different type of results
            # see "Response Fields" in this page: https://developer.foursquare.com/docs/venues/search.html
            # for more details
            places = foursquare.venues.search(:query => params[:name], :ll => "40.72951470,-73.99718790", :radius =>"1000.0", :intent=>"browse")
            if !places.empty?
              @venues = places["places"]
              @venues.sort{|x,y| y.name <=> x.name }
            end
      end
    end
    
    def show
      @users = []
      @venue = foursquare.venues.find(params[:id])
      @photos = @venue.photos
      @checkins = @venue.here_now_checkins
      @checkins.each do |checkin|
        @users<< checkin.user
      end
      
    end
    
    def user
    end
end