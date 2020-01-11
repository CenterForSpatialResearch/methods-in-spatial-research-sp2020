pandoc \
--filter pandoc-citeproc \
--bibliography=./tex/library.bib \
--csl=./tex/chicago-fullnote-bibliography.csl \
--pdf-engine=lualatex \
-H ./tex/default.tex \
-s syllabus.md \
-o ../syllabus.pdf