require './src/filterText'

module Archive
    class ArchiveID
        def initialize(path, lines)
            @path = path
            @nofLines = lines
        end
    
        def getPath
            return @path
        end
        def getLines
            return @nofLines
        end
    
        def setPath(path)
            @path = path
        end
        def setLines(lines)
            @lines = lines
        end
    end
    
    def Archive.inspector(fileList)

        fID = Array.new(0)
        for i in 0..fileList.size-1
            path = fileList[i]
            lines = File.open(fileList[i]).readlines.size

            f = ArchiveID.new(path, lines)
            fID.push(f)
        end
        return fID
    end

    def Archive.list
        r = Dir['./English/*.mtf'].select {|f| !File.directory? f}
        puts("#{r.size} files to translate")
        return r
    end

    def Archive.read(path, bigText, allChars)
        line_num = 0
        text = File.open(path).read
        text.gsub!(/\r\n?/, "\n")

        text.each_line do |line|
                bigText.push(Filter.string(line))
                allChars = allChars + line.size
            line_num +=1
        end
        return allChars
    end

    def Archive.write(filePath, text)
        File.write(filePath, text, mode: 'a')
    end
end