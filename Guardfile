# More info at https://github.com/guard/guard#readme

guard :shell do
    watch(/(artigo.latex|artigo.md|anexos.md|apendices.md)/) do |m|
        puts m
        puts "\n\n#{Time.now.strftime('%H:%M:%S')} #{m[0]} alterado. Re-gerando PDF do artigo."

        system "rake artigo"

        # Exibe erros de citações inválidas
        system %{ pdfgrep -H --color always '\\[\\?\\]' out/\"Artigo\ -\ FILHO,\ Luiz\ -\ BENEFÍCIOS\ INCIDENTAIS\ DA\ MODELAGEM\ DE\ PROCESSOS\ PARA\ A\ CULTURA\ ORGANIZACIONAL\".pdf }
    end

    watch(/(proposta.latex|plano.md|proposta.md)/) do |m|
        puts "\n\n#{Time.now.strftime('%H:%M:%S')} Proposta alterada. Re-gerando PDF."

        system "rake proposta"

        # Exibe erros de citações inválidas
        system %{ pdfgrep -H --color always '\\[\\?\\]' out/"Proposta\ de\ Trabalho\ -\ Luiz\ Gonzaga\ dos\ Santos\ Filho".pdf }
    end
end
