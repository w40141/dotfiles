#!/usr/bin/env perl

# LaTeX
$latex = 'uplatex -synctex=1 -halt-on-error -file-line-error %O %S';
$max_repeat = 5;

# BibTeX
$bibtex = 'upbibtex %O %S';
$biber = 'biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# index
$makeindex = 'mendex %O -o %D %S';

# DVI / PDF
$dvipdf = 'dvipdfmx %O -o %D %S';
$pdf_mode = 3;

# Use Skim as a previewer
$pdf_previewer = "open -ga /Applications/Skim.app";

# clean up
$clean_full_ext = "%R.synctex.gz"
