class CountriesController < ApplicationController
  def index
    @all_countries = Country.all

    #if no limit is specified, it will display
    #between 5 - 10 countries

    limit = params[:limit].to_i
    limit = rand(5..10) if limit.zero?

    @countries_to_display = @all_countries.sample(limit)
    @countries_to_display.sort! { |a,b| a["name"] <=> b["name"] }

  end

  def search
    if params[:search].blank?
      #redirect_to(search_page_path, alert: "Empty field!") and return
      #redirect_to(countries_index_path, alert: "Empty field!") and return
    else
      redirect_to(search_page_path, alert: "Working on it") and return
    end
  end
  
end