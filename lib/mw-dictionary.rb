require 'net/http'
require 'json'

require 'client/client.rb'
require 'parser/parser.rb'
require 'cache/cache.rb'

module MWDictionaryGem
  class Dictionary

    def initialize(dict_api_key, thes_api_key = nil)
      @cache = Cache.new
      @client = Client.new(dict_api_key, thes_api_key)
      @url = "https://www.dictionaryapi.com/api/v3/references"
      super()
    end

    def search(word, thes=nil)
      puts "[ #{word} ]"
      res = @cache.get(word, thes)
      if res 
        puts res
        return
      end
      @thesaurus = !!thes
      @word = word
      url = ((@thesaurus) ? "#{@url}/thesaurus/json/" : "#{@url}/collegiate/json/") + @word
      response, json = @client.request(url, @thesaurus)
      display(json)
    end

    def display(json)
      @cache.add(@word, @thesaurus, @thesaurus ? parse_thesaurus(json) : parse_dict(json))
    end
  end
end
