require 'rake/clean'

# Altere esses valores para falso, caso não deseje utilizar os anexos ou apêndices.
ANEXOS=true
APENDICES=true

ARTIGO_LATEX = "xxx-artigo.tex"
ARTIGO_PDF = "xxx-artigo.pdf"
PROPOSTA_ARTIGO_LATEX = "xxx-proposta-de-artigo.tex"
PROPOSTA_ARTIGO_PDF = "xxx-proposta-de-artigo.pdf"

desc "Gera e executa compilacao da proposta do artigo"
task :proposta do

  system "pandoc -f markdown+raw_tex proposta-de-artigo.md --data-dir=. --template=proposta-de-artigo --filter pandoc_abnt -o #{PROPOSTA_ARTIGO_LATEX} --top-level-division=section"

  system "latexmk -f -silent -pdf #{PROPOSTA_ARTIGO_LATEX}"

  system "mv #{PROPOSTA_ARTIGO_PDF} \"out/Proposta\ de\ Trabalho\ -\ Luiz\ Gonzaga\ dos\ Santos\ Filho\".pdf"

  Rake::Task[:clean].execute
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

  system "pandoc -f markdown+raw_tex artigo.md --data-dir=. --template=artigo-abntex2 --filter pandoc_abnt -o #{ARTIGO_LATEX} #{inclui_apendices} #{inclui_anexos} --top-level-division=section"

  system "latexmk -f -silent -pdf #{ARTIGO_LATEX}"

  system "mv #{ARTIGO_PDF} out/\"Artigo\ -\ Luiz\ Gonzaga\ dos\ Santos\ Filho\".pdf"

  Rake::Task[:clean].execute
end

task :default => [:artigo]

CLEAN.include(FileList["xxx*"])
