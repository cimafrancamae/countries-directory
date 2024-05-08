class CountriesController < ApplicationController
  before_action :set_rest_countries

  def index
    @countries = @client.all
  end

  def show
    @country = @client.code(params[:id])
  end
end
