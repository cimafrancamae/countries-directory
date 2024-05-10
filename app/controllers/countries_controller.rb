class CountriesController < ApplicationController
  include CountriesConcern

  def index
    @countries = all_countries
  end

  def show
    @country = fetch_code(params[:id])
  rescue RestCountries::Error => e
    render turbo_stream:
      turbo_stream.prepend("toast", partial: "shared/toast", locals: { message: e.message })
  end

end
