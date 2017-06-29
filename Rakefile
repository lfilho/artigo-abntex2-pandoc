require 'rake/clean'

# Altere esses valores para falso, caso não deseje utilizar os anexos ou apêndices.
ANEXOS=true
APENDICES=true
PLANO_DE_TRABALHO=true

ARTIGO_LATEX = "xxx-artigo.tex"
ARTIGO_PDF = "xxx-artigo.pdf"
PROPOSTA_LATEX = "xxx-proposta.tex"
PROPOSTA_PDF = "xxx-proposta.pdf"
SILENT = ENV['DEBUG'] ? '' : '-silent'

desc "Gera e executa compilacao da proposta do artigo"
task :proposta do
  inclui_plano = ""

  if PLANO_DE_TRABALHO then
    system "pandoc -f markdown+raw_tex plano.md --filter pandoc_abnt -o xxx-plano.tex --top-level-division=chapter"
    inclui_plano = "-A xxx-plano.tex"
  end

  system <<-EOS
    pandoc -f markdown+raw_tex proposta.md --data-dir=. --template=proposta --filter pandoc_abnt -o #{PROPOSTA_LATEX} #{inclui_plano} --top-level-division=section && \
    latexmk -f #{SILENT} -pdf #{PROPOSTA_LATEX} && \
    mv #{PROPOSTA_PDF} \"out/Proposta\ de\ Trabalho\ -\ Luiz\ Gonzaga\ dos\ Santos\ Filho\".pdf
  EOS
end

desc "Gera e executa compilacao do artigo"
task :artigo do
  inclui_apendices = ""
  inclui_anexos = ""

  if APENDICES then
    system "pandoc -f markdown+raw_tex apendices.md --filter pandoc_abnt -o xxx-apendices.tex --top-level-division=chapter"
    inclui_apendices = "-A xxx-apendices.tex"
  end

  if ANEXOS then
    system "pandoc -f markdown+raw_tex anexos.md --filter pandoc_abnt -o xxx-anexos.tex --top-level-division=chapter"
    inclui_anexos = "-A xxx-anexos.tex"
  end

  system <<-EOS
    pandoc -f markdown+raw_tex artigo.md --data-dir=. --template=artigo --filter pandoc_abnt -o #{ARTIGO_LATEX} #{inclui_apendices} #{inclui_anexos} --top-level-division=section && \
    latexmk -f #{SILENT} -pdf #{ARTIGO_LATEX} && \
    mv #{ARTIGO_PDF} out/\"Artigo\ -\ Luiz\ Gonzaga\ dos\ Santos\ Filho\".pdf && \
    ./static_check.sh
  EOS
end

task :default => [:artigo]

CLEAN.include(FileList["xxx*"])
