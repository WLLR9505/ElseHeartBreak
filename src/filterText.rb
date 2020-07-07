module Filter
    def Filter.string(text)
        start = example.index("\=\> \"")
        
        return example[start+3... example.size] # ignora trecho em suíço e '=>'
    end
end
