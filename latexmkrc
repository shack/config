# $pdf_mode = 1; # pdflatex
# $pdf_mode = 2; # ps -> pdf
# $pdf_mode = 3; # dvi -> ps -> pdf
# $pdf_mode = 4; # lualatex
# $pdf_mode = 5; # xelatex
$clean_ext = 'aux log toc lof lot bbl blg out ptb xyc cb idx ist ilg ind glo glg gls nlo nls nav snm';
$pdflatex = 'pdflatex -file-line-error -shell-escape -synctex=1 -interaction=nonstopmode %O %S';
$xelatex  = 'xelatex -file-line-error -shell-escape -synctex=1 -interaction=nonstopmode %O %S';
$postscript_mode = $dvi_mode = 0;
