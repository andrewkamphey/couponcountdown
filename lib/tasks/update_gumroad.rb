namespace :archive do
  desc "Your description"
  task update_gumroad: :environment do


    puts "About to update gumroad data"


    require 'net/http'
    require 'uri'
    require 'json'


    uri = URI.parse("https://api.gumroad.com/v2/products/bssPBdoqWg9XgIMgSXUdTg==/offer_codes")
    request = Net::HTTP::Get.new(uri)
    request.set_form_data(
    "access_token" => Figaro.env.ACCESS_TOKEN,
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

          # names_array.push(key)
          # times_used_array.push(val)

        Coupon.create(
            code: key,
            times_used: val
        )
          
        end
      end

    api_key    = ENV["gumroad_api_key"]

    # Your code here
    end

    puts ""
    puts "Done!"
  end
end