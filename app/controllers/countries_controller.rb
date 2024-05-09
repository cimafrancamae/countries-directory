class CountriesController < ApplicationController
  include CountriesConcern

  def index
    @countries = all_countries

    if params[:query]
      query = params[:query]
      if query.downcase == "all"
        @countries = all_countries
      else
        region = URI.encode_www_form_component(query)
        @countries = fetch_region(region)
      end
      respond_to do |format|
        format.html { render :index }
        format.turbo_stream
          turbo_stream.update("countries", partial: "countries", locals: { countries: @countries})
      end
    end
  end

  def show
    @country = fetch_code(params[:id])
  end

end
