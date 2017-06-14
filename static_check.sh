#!/usr/bin/env bash

# Util functions

print_in_color() {
    printf "%b" \
        "$(tput setaf "$2" 2> /dev/null)" \
        "$1" \
        "$(tput sgr0 2> /dev/null)\n"
}

print_in_red()    {
    print_in_color "$1" 1
}
print_in_green()  {
    print_in_color "$1" 2
}
print_in_yellow() {
    print_in_color "$1" 3
}

status_print() {
    local string=$1
    local value=$2
    local reference_value=$3
    local percentual_value=$(($value*100/$reference_value))
    local final_string="$string $value de $reference_value (${percentual_value}%)"

    if [ $value -ge $reference_value ]; then
        print_in_green "$final_string"
    elif [ $value -ge $((${reference_value}/2)) ]; then
        print_in_yellow "$final_string"
    else
        print_in_red "$final_string"
    fi
}

# The static analysis itself:

max_num_of_pages=18
avg_num_of_chars=24000

pdf_file="out/Artigo - Luiz Gonzaga dos Santos Filho.pdf"
pdf_to_text=`pdftotext "$pdf_file" -`
rm "out/Artigo - Luiz Gonzaga dos Santos Filho.txt"

num_of_pages=`podofocountpages -s "$pdf_file"`
num_of_words=`echo "$pdf_to_text" | wc -w | xargs`
num_of_chars=`echo "$pdf_to_text" | wc -m | xargs`

echo "---------------------------"
echo "Análise estática do artigo:"
echo "---------------------------"
echo ""
status_print "Número de páginas:" $num_of_pages $max_num_of_pages
# status_print "Número de palavras:" $num_of_words 89
status_print "Número de caracteres:" $num_of_chars $avg_num_of_chars
