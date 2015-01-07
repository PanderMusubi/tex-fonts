tex-fonts
=========

LaTeX packages with fonts for CTAN and TeX Live

This repository contains additional fonts for CTAN and, indirectly, TeX Live. A LaTeX package can be generated in each directory for a specific typeface. It will download the needed font files and create an archive that can be submitted to CTAN.

The typefaces and underlying font files are mainly for body texts. Each directory has documentation in a file called README.md. In there all information is needed for a complete submission of the generated package to CTAN.

The following CTAN topics are referred to in the documentation:
* general topics (required):
  * font _fonts them­selves_
  * font-body _font de­signed for use as body font for Latin-based script documents_
  * font-bookhand _fonts of scripts used for manuscript books_
  * font-multilingual _font with adaptations to several languages_
* language specific (which are applicable):
  * font-arabic _fonts for type­setting arabic_
  * font-cjk _fonts for far eastern languages (Chinese, Japanese and Korean)_
  * font-arabic _fonts for type­setting arabic_
  * font-cyrillic _fonts for Cyrillic and related scripts_
  * font-egyptian _hieroglyph fonts_
  * font-greek _font for Greek (archaic, classical and modern)_
  * font-hebrew _font for Hebrew script_
  * font-thai _font for type­setting Thai script_
* design specific topics (minimally one of each set):
  * font-sans _Sans-serif font_
  * font-serif _Serif font_
  * font-proportional _variable-spaced font_
  * font-mono _monospaced font_
* optional additional topics (if special additional fonts are shipped):
  * font-maths _fonts for use in mathematics_
  * font-calligraphic _calligraphic (or hand­writing) fonts_ 
  * font-symbol _fonts that provide collections of symbols_
* technology specific topics (minimally one of both):
  * font-otf _font in OpenType format_
  * font-ttf _font available in TrueType format_
