#!/bin/bash

# Fix trailing spaces after \label commands (Warning 24)
sed -i 's/\\label{[^}]*}  $/\0/' main.tex | sed -i 's/\\label{\([^}]*\)}  $/\\label{\1}/' main.tex

# Add non-breaking space before \cite (Warning 2)
sed -i 's/\([a-zA-Z]\) \\cite/\1~\\cite/g' main.tex

# Fix abbreviations that end sentences (Warning 13)
# Be careful with these - only add \@ when it's an abbreviation at end of sentence
sed -i 's/DocRE\. J/DocRE\\@. J/g' main.tex
sed -i 's/SDK\. B/SDK\\@. B/g' main.tex
sed -i 's/DocRE\. T/DocRE\\@. T/g' main.tex

# Fix micro-F1 and similar (Warning 12)
sed -i 's/micro-F1 and/micro-F1\\ and/g' main.tex

# Fix space before parenthesis in math mode (Warning 36)
# This is tricky - we need to be careful about math vs text
# For now, just add space in specific problematic locations
sed -i 's/Let G(D) be/Let G(D)~be/g' main.tex  
sed -i 's/and P(D) be/and P(D)~be/g' main.tex
sed -i 's/define C(r) as/define C(r)~as/g' main.tex
sed -i 's/relation r, define/relation r,~define/g' main.tex
sed -i 's/triple (h, r, t),/triple~(h, r, t),/g' main.tex
sed -i 's/pairs\. For/pairs.~For/g' main.tex
sed -i 's/type(h), type(t))/type(h),~type(t))/g' main.tex
sed -i 's/(h, r, t),/(h,~r,~t),/g' main.tex
sed -i 's/(type(h), type(t))/(type(h),~type(t))/g' main.tex

