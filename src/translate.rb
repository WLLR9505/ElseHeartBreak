require 'net/http'
require 'json'
require 'uri'

module Translate
    def Translate.translate(text)
        sourceLang = 'en'
        targetLang = 'pt-br'

        url = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=#{sourceLang}&tl=#{targetLang}&dt=t&q=#{URI.escape(text)}"

        uri = URI(url)
        
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)

        return response[0][0][0]
    end
end

