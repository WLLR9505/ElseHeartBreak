module List
    def List.files
        r = Dir['./English/*.mtf'].select {|f| !File.directory? f}
        puts("#{r.size} files to translate")
        return r
    end
end