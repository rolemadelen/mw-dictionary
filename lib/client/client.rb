class Client
  attr_accessor :api_key

  def initialize(dict, thes)
    @api_key = {
      dict: dict,
      thes: thes
    }
  end

  def request(url, thes)
    api_key = @api_key[thes ? :thes : :dict]
    if !api_key
      puts "Please provide the API Key...\n"
      exit(1)
    end

    uri = URI("#{url}?key=#{api_key}")
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)
    [response, json]
  end
end

