class ApplicationController < ActionController::Base
  def set_rest_countries
    @client = RestCountries::Client.new
  end
end
