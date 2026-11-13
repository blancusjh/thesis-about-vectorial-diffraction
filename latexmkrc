# Build PDF through LuaLaTeX.
$pdf_mode = 4;
$lualatex = 'lualatex -interaction=nonstopmode -file-line-error %O %S';

# Keep generated files in build/ and publish only the finished PDF beside the TeX.
$out_dir = 'build';
$out2_dir = '.';
@out2_exts = ('pdf');

# Let latexmk pass the build directory to biber.
$bibtex_use = 2;
$biber = 'biber %O %B';

# Refresh compressed previews only when their full-quality source changes.
my $preview_status = system('./scripts/generate_fast_figures.sh');
die "Could not generate optimized figure previews\n" if $preview_status != 0;
