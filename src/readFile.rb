require './src/translate'
require './src/filterText'
require './src/writeFile'

module Read
    def Read.file(path)
        line_num = 0
        text = File.open(path).read
        text.gsub!(/\r\n?/, "\n")
        text.each_line do |line|
            eng = Filter.string(line)
            sleep(0.5)
            translated = Translate.translate(eng)
            # translated = "\"TRANSLATED HERE\""
            endLine = line.index("\=\> \"") #separa parte suíça

            Write.file("./Portuguese/#{path[10...path.size]}", "#{line[0...endLine]}\=\> #{translated}\n") # suiço => traduzido

            system("cls")
            line_num +=1
            print("#{line_num} lines from #{text.each_line.count}\n") #progresso por arquivo
        end
    end
end
