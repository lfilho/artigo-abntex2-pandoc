require 'rake/clean'

# Altere esses valores para falso, caso não deseje utilizar os anexos ou apêndices.
ANEXOS=true
APENDICES=true

ARTIGO_LATEX = "xxx-artigo.tex"
PROPOSTA_ARTIGO_LATEX = "xxx-proposta-de-artigo.tex"

desc "Gera e executa compilacao da proposta do artigo"
task :compilacao_proposta do

  system "pandoc -f markdown+raw_tex proposta-de-artigo.md --data-dir=. --template=proposta-de-artigo --filter pandoc_abnt -o #{PROPOSTA_ARTIGO_LATEX} --top-level-division=section"

  system "latexmk -f -silent -pdf #{PROPOSTA_ARTIGO_LATEX}"
end

desc "Gera e executa compilacao do artigo"
task :compilacao_artigo do

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
end

task :default => [:compilacao_artigo]

CLEAN.include(FileList["xxx*"])
