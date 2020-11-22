class Country
    include HTTParty

    default_options.update(verify: false) # Turn off SSL verification
    base_uri 'https://restcountries.eu/rest/v2/'
    
    format :json

    def self.all
        @countries = get("/all")

        @countries.each do |country|
            if country['borders'].empty?
                country['borders'] << "I'm an island!"
            else country['borders'].map! do |country_code|
                @countries.find { |country| country['alpha3Code'] == country_code } ['name']
                end
            end
            country['languages'].map! { |language| language['name'] }
            country['currencies'].map! { |currency| currency['name'] }
        end

        @countries

    end

    def search
        @country_search = get("/all")

    end
    
end

