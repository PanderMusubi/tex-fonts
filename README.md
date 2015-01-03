tex-fonts
=========

LaTeX packages with fonts for CTAN and TeX Live

This repository contains additional fonts for CTAN and, indirectly, TeX Live. A LaTeX package can be generated in each directory for a specific typeface. It will download the needed font files and create an archive that can be submitted to CTAN.

The typefaces and underlying font files are mainly for body texts. Each directory has documentation in a file called README.md. In there all information is needed for a complete submission of the generated package to CTAN.

The following CTAN topics are referred to in the documentation:
* general topics (required):
  * font _fonts them­selves_
  * font-body _font de­signed for use as body font for Latin-based script doc­u­ments_
  * font-bookhand _fonts of scripts used for manuscript books_
  * font-multilingual _font with adap­ta­tions to sev­eral lan­guages_
* language specific (which are applicable):
  * font-arabic _fonts for type­set­ting ara­bic_
  * font-cjk _fonts for far east­ern lan­guages (Chi­nese, Ja­panese and Korean)_
  * font-arabic _fonts for type­set­ting ara­bic_
  * font-cyrillic _fonts for Cyril­lic and re­lated scripts_
  * font-egyptian _hi­ero­glyph fonts_
  * font-greek _font for Greek (ar­chaic, clas­si­cal and mod­ern)_
  * font-hebrew _font for He­brew script_
  * font-thai _font for type­set­ting Thai script_
* design specific topics (minimally one of each set):
  * font-sans _Sans-serif font_
  * font-serif _Serif font_
  * font-proportional _vari­able-spaced font_
  * font-mono _monospaced font_
* optional additional topics (if special additional fonts are shipped):
  * font-maths _fonts for use in math­e­mat­ics_
  * font-calligraphic _cal­li­graphic (or hand­writ­ing) fonts_ 
  * font-symbol _fonts that pro­vide col­lec­tions of sym­bols_
* technology specific topics (minimally one of both):
  * font-otf _font in OpenType for­mat_
  * font-ttf _font avail­able in TrueType for­mat_
