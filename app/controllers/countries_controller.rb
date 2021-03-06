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
      flash[:notice] = "Empty field!"
    else
      @parameter = params[:search].capitalize
      @countries_to_display = Country.for(@parameter)
    end
  end
  
end