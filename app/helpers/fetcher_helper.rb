module FetcherHelper
    def fetch(type)

        #search the make
        uri = URI("http://www.webmotors.com.br/carro/" + type)

        # Make request for Webmotors site
        search_items = type == "modelos" ? {marca: params[:webmotors_make_id]} : {}

        response = Net::HTTP.post_form(uri, search_items)
        return JSON.parse response.body
    end
end