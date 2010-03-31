(TeX-add-style-hook "SOAR"
 (lambda ()
    (LaTeX-add-bibliographies
     "refs")
    (LaTeX-add-labels
     "sec:intro"
     "sec:localsoc"
     "sec:memory"
     "sec:specifying"
     "sec:lib.loc.lib"
     "sec:central"
     "sec:dataUtils"
     "sec:rprofile"
     "sec:scripts"
     "sec:technical"
     "sec:similarPackages"
     "sec:ASOR")
    (TeX-add-symbols
     "R")
    (TeX-run-style-hooks
     "hyperref"
     "xspace"
     "latex2e"
     "art12"
     "article"
     "12pt")))

