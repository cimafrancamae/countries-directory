#frozen_string_literal: true

module CountriesConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_rest_countries

    def all_countries
      Rails.cache.fetch("all_countries_cache", expires_in: 24.hours) do
        @client.all
      end
    end

    def fetch_country(country)
      Rails.cache.fetch("#{country}_cache", expires_in: 24.hours) do
        @client.name(country)
      end
    end

    def fetch_region(region)
      Rails.cache.fetch("#{region}_cache", expires_in: 24.hours) do
        @client.region(region)
      end
    end

    def fetch_code(code)
      Rails.cache.fetch("#{code}_cache", expires_in: 24.hours) do
        @client.code(code)
      end
    end
  end

  private

  def set_rest_countries
    @client = RestCountries::Client.new
  end
end
