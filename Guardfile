# More info at https://github.com/guard/guard#readme

guard :shell do
  watch(/(artigo.md|anexos.md|apendices.md)/) do |m|

    puts "#{Time.now.strftime('%H:%M:%S')} #{m[0]} foi alterado. Iniciando geração do PDF"
    `rake artigo`
    # Exibe erros de citações inválidas
    `pdfgrep  -H --color always '\\[\\?\\]' xxx-artigo.pdf`
  end

  watch(/(proposta-de-artigo.md)/) do |m|

    puts "#{Time.now.strftime('%H:%M:%S')} Proposta de Artigo alterada. Gerando PDF."
    `rake proposta`
    # Exibe erros de citações inválidas
    `pdfgrep  -H --color always '\\[\\?\\]' xxx-proposta-de-artigo.pdf`
  end
end
