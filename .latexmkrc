#!/usr/bin/env perl

# $latex            = 'uplatex -synctex=1 -halt-on-error';
# $latex_silent     = 'uplatex -synctex=1 -halt-on-error -interaction=batchmode';
# $bibtex           = 'upbibtex';
# $dvipdf           = 'dvipdfmx %O -o %D %S';
# $makeindex        = 'mendex %O -o %D %S';
# $max_repeat       = 5;
# $pdf_mode	  = 3; # generates pdf via dvipdfmx
#
# # Prevent latexmk from removing PDF after typeset.
# # This enables Skim to chase the update in PDF automatically.
# $pvc_view_file_via_temporary = 0;
#
# LaTeX
$latex = 'platex -synctex=1 -halt-on-error -file-line-error %O %S';
$max_repeat = 5;

# BibTeX
$bibtex = 'pbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# index
$makeindex = 'mendex %O -o %D %S';

# DVI / PDF
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

# Use Skim as a previewer
$pdf_previewer = "open -ga /Applications/Skim.app";
# $pvc_view_file_via_temporary = 0;
# if ($^O eq 'linux') {
#     $dvi_previewer = "xdg-open %S";
#     $pdf_previewer = "xdg-open %S";
# } elsif ($^O eq 'darwin') {
#     $dvi_previewer = "open %S";
#     $pdf_previewer = "open %S";
# } else {
#     $dvi_previewer = "start %S";
#     $pdf_previewer = "start %S";
# }

# clean up
$clean_full_ext = "%R.synctex.gz"
