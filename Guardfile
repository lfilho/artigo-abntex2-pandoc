# More info at https://github.com/guard/guard#readme

guard :shell do
    watch(/(artigo.md|anexos.md|apendices.md)/) do |m|
        puts "\n\n#{Time.now.strftime('%H:%M:%S')} #{m[0]} alterado. Re-gerando PDF do artigo."

        `rake artigo`

        # Exibe erros de citações inválidas
        `pdfgrep  -H --color always '\\[\\?\\]' out/"Artigo\ -\ Luiz\ Gonzaga\ dos\ Santos\ Filho".pdf`
    end

    watch(/(proposta.md)/) do |m|
        puts "\n\n#{Time.now.strftime('%H:%M:%S')} Proposta alterada. Re-gerando PDF."

        `rake proposta`

        # Exibe erros de citações inválidas
        `pdfgrep  -H --color always '\\[\\?\\]' out/"Proposta\ de\ Trabalho\ -\ Luiz\ Gonzaga\ dos\ Santos\ Filho".pdf`
    end
end
