require './src/archive'
require './src/translate'

#1 Listar arquivos
#2 Ler o máximo de linhas possível no arquivo
#3 Criar dois arrays, para alinhar lado suíço e ingles
#4 Traduzir o array inglês
#5 Reescrever arquivos baseado no objeto indicando as linhas (escrita modo fila)

system("cls")

listToTranslate = Archive.list()
filesTranslated = 0
allChars = 0

bruteText = ""

files = Archive.inspector(listToTranslate)

for i in 0...files.size-1
    bigText = Array.new(0) #armazena suiço / inglês

    Archive.read(files[i].getPath, bigText, allChars)
    print("\nTraduzindo #{files[i].getPath}")

    bruteText = ""
    for i2 in 0...bigText.size
        bruteText = "#{bruteText}#{bigText[i2][1]} " # separa inglês
    end
    w = 0 # resetado por arquivos pois é usado pra associar o array bigText[] lado suíco com o novo array traduzido que pode estar quebrado em chunks
    if bigText.size > 100
        chunkSize = (bigText.size / 100).to_f.ceil # numero de chunks com pelo menos 100 linhas
        maxLines = bigText.length / chunkSize # limite de linhas por chunk
        c = 0
        w = 0

        for i3 in 0...chunkSize # repete de acordo com o número de chunks
            bruteText = ""

            for c in c...c+maxLines
                bruteText = "#{bruteText}#{bigText[c][1]} "
                c = c + 1
            end

            bruteTranslated = Translate.translate(bruteText)
            chunkTranslated = bruteTranslated.split("\n")

            for i4 in 0...chunkTranslated.length
                if chunkTranslated[i4][0] == " "
                    chunkTranslated[i4][0] = ""
                end
                Archive.write("./Portuguese/#{listToTranslate[i][10...listToTranslate[i].length]}", "#{bigText[w][0]} \=\> #{chunkTranslated[i4]}\n")
                w = w + 1 # referência o par suíço para alinhar corretamente com a tradução
            end
        end
    else
        bruteTranslated = Translate.translate(bruteText)
        chunkTranslated = bruteTranslated.split("\n")
        for i4 in 0...chunkTranslated.length
            if chunkTranslated[i4][0] == " "
                chunkTranslated[i4][0] = ""
            end
            Archive.write("./Portuguese/#{listToTranslate[i][10...listToTranslate[i].length]}", "#{bigText[w][0]} \=\> #{chunkTranslated[i4]}\n")
            w = w + 1 # referência o par suíço para alinhar corretamente com a tradução
        end
    end
end