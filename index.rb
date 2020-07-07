require './src/listFiles'
require './src/readFile'

#1 Listar arquivos
#2 Ler o conteúdo dos arquivos
#3 Filtrar o conteúdo dos lido
#4 Traduzir conteúdo dos arquivos
#5 Reescrever arquivos

listToTranslate = List.files()

for i in 0..listToTranslate.size
    textInFile = Read.file("#{listToTranslate[i]}")
end