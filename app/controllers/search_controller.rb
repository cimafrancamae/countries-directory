require 'uri'

class SearchController < CountriesController
  def search_region
    query = params[:query]
    region = URI.encode_www_form_component(query)
    @countries = @client.region(region)
    render turbo_stream:
      turbo_stream.update("countries", partial: "countries", locals: { countries: @countries})
  end

  def search_country
    query = params[:query]
    # name = URI.encode_www_form_component(query)
    @countries = @client.all
    @countries.select do |country|
      country["name"].downcase.include?(query) || country["name"].downcase.include?(query)
    end
    render turbo_stream:
      turbo_stream.update("countries", partial: "countries", locals: { countries: @countries})
  end
end
