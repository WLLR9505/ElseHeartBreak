module Write
    def Write.file(filePath, text)
        File.write(filePath, text, mode: 'a')
    end
end
