class SearchController < CountriesController
  def search_region
    query = params[:query]
    if query.downcase == "all"
      @countries = all_countries
    else
      region = URI.encode_www_form_component(query)
      @countries = fetch_region(region)
    end

    if request.path == countries_path
      render turbo_stream:
        turbo_stream.update("countries", partial: "countries", locals: { countries: @countries})
    else
      redirect_to countries_path
    end
  end

  def search_country
    query = params[:query]
    if query.strip.empty?
      @countries = all_countries
    else
      @countries = fetch_country(query)
    end
    render turbo_stream:
      turbo_stream.update("countries", partial: "countries", locals: { countries: @countries})
  end
end
