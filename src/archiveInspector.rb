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
end