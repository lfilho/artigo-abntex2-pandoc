# More info at https://github.com/guard/guard#readme

guard :shell do
  watch(/^([[:alpha:]]+.*\.md)$/) do |m| 
    
    puts "#{Time.now.strftime('%H:%M:%S')} #{m[0]} foi alterado. Iniciando geração do PDF"
    `rake`
    # Exibe erros de citações inválidas
#    `pdfgrep  -H --color always '\(\\?\\?\)' jucs_sample_paper_latex.pdf`
    `pdfgrep  -H --color always '\\[\\?\\]' jucs_sample_paper_latex.pdf`
  end
end
