#! /usr/bin/env bash
# First, unzip style-ps.zip.  Then, in another directory, unzip all six of
# those zip files.  Then do the following:
set -x
mkdir tmp &&
    cd tmp &&
    unzip -L ../style-ps.zip &&
    mkdir tmp &&
    cd tmp &&
    for i in ../*.zip; do unzip -L $i; done  && 
    for i in *.ps; do ps2pdf $i $(basename $i .ps).pdf; done &&
    qpdf --empty -pages covers.pdf 1-3 -- covers_fixed.pdf &&
    pdfunite covers_fixed.pdf preface.pdf ack.pdf toc.pdf intro.pdf source_c.pdf readabil.pdf prog_str.pdf prog_pra.pdf concurr.pdf portabil.pdf reuse.pdf performa.pdf complete.pdf appendix.pdf ref.pdf bib_0188.pdf index.pdf 83style.pdf
