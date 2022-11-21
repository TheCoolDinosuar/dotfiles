# Asymptote
sub run_asy {
    return system("asy -o \$(dirname '$_[0]') '$_[0]'");
}
add_cus_dep("asy", "eps", 0, "run_asy");
add_cus_dep("asy", "pdf", 0, "run_asy");
add_cus_dep("asy", "tex", 0, "run_asy");

# Pythontex
sub pythontex {
    return system("pythontex.py \"pythontex-files-$_[0]/$_[0]\""); 
}
add_cus_dep("pytxcode", "pytxmcr", 0, "pythontex");

@generated_exts = ( 'aux', 'bbl', 'bcf', 'fls', 'idx', 'ind', 'lof',
                    'lot', 'out', 'pre', 'toc', 'nav', 'snm',
                    'synctex.gz', 'pytxpyg', 'pytxmcr', 'pytxcode', );
