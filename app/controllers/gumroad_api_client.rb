class GumroadApi

    require 'net/http'
    require 'uri'
    require 'json'


    uri = URI.parse("https://api.gumroad.com/v2/products/bssPBdoqWg9XgIMgSXUdTg==/offer_codes")
    request = Net::HTTP::Get.new(uri)
    request.set_form_data(
    "access_token" => "05d2e1ad1b07354e27c3e329813ae964be792493d361811e8c4bbc72f78ba6bd",
    )

    req_options = {
    use_ssl: uri.scheme == "https",
    }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
      end
    
   names_array = []
   times_used_array = []

      json = JSON.parse(response.body)
      json["offer_codes"].each do |name|
        if  name["name"].include? "gumroadday"
          key = name["name"]
          val = name["times_used"].to_i

          names_array.push(key)
          times_used_array.push(val)
          
        end
      end
      puts names_array
      puts times_used_array

end



