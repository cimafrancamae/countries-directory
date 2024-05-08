class CountriesController < ApplicationController
  def index
    client = RestCountries::Client.new
    @countries = client.all
  end

  def show; end
end
