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
        sleep(1)

        bruteTranslated = ""

        for i in 0...response[0].size
            bruteTranslated = bruteTranslated + response[0][i][0]
        end
        return bruteTranslated
    end
end

