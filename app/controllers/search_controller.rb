require 'uri'

class SearchController < CountriesController
  def search_region
    query = params[:query]
    if query.downcase == "all"
      @countries = @client.all
    else
      region = URI.encode_www_form_component(query)
      @countries = @client.region(region)
    end
    render turbo_stream:
      turbo_stream.update("countries", partial: "countries", locals: { countries: @countries})
  end

  def search_country
    query = params[:query]
    @countries = @client.name(query)
    render turbo_stream:
      turbo_stream.update("countries", partial: "countries", locals: { countries: @countries})
  end
end
