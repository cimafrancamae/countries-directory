class CountriesController < ApplicationController
  include CountriesConcern

  def index
    @countries = all_countries
  end

  def show
    @country = fetch_code(params[:id])
  end

end
