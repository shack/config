$pdf_mode = 1;
$clean_ext = 'aux log toc lof lot bbl blg out ptb xyc cb idx ist ilg ind glo glg gls nlo nls nav snm';
$pdflatex = 'xelatex -file-line-error -shell-escape -synctex=1 -interaction=nonstopmode %O %S';
$postscript_mode = $dvi_mode = 0;
