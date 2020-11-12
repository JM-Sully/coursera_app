class Country
    include HTTParty

    base_uri 'https://restcountries.eu/rest/v2/'
    format :json

    def self.all
        countries = get("/all")

        countries.each do |country|
            country['borders'].map! do |country_code|
                countries.find { |country| country.['alpha3code'] = country_code } ['name']
            end
            country['languages'].map! { |language| language.['name'] }
            country['currencies'].map! { |currency| currency.['name'] }
        end

        countries

    end
end

