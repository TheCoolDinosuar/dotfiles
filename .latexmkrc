$pdf_previewer = 'start /mnt/c/users/fluff/AppData/Local/SumatraPDF/sumatra.exe';
sub asy {return system("asy \"$_[0]\"");}
add_cus_dep("asy","eps",0,"asy");
add_cus_dep("asy","pdf",0,"asy");
add_cus_dep("asy","tex",0,"asy");
