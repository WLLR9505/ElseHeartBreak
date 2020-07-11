module Filter
    def Filter.selectEnglish(text)
        return text.split("[]")
    end

    def Filter.string(text)

        div = text.index(/ => /)
        
        swiss = text[0...div]
        english = text[div+4...text.size]

        return [swiss, english]
    end
end
