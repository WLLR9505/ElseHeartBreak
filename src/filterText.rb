module Filter
    def Filter.string(text)
        start = text.index("\=\> \"")

        return text[start+3... text.size] # ignora trecho em suíço e '=>'
    end
end
