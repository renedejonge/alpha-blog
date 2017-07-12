class SearchController < ApplicationController

  def new

  end

  def create
    @search = params["zoek"][:zoekterm]
    #flash[:success] = "You searched for \"#{@search}\""
    @resultaat = User.find_by(username: @search)
    flash[:success] = "#{@resultaat.email}"
    redirect_to users_path
  end

end