Extreme document styling in four reporting formats rtf pdf excel and html

   EXTREME DOCUMENT STYLING IN FOUR OUTPUT FORMATS RTF PDF EXCEL AND HTML

       1. rtf
       2. html
       3. pdf
       4. excel


 To see highly stylized output

   PDF
   https://tinyurl.com/ycf8ofyw
   https://github.com/rogerjdeangelis/utl_extreme_document_styling_in_four_reporting_formats/blob/master/unicode.pdf

   HTM
   https://tinyurl.com/yc24g5x4
   https://github.com/rogerjdeangelis/utl_extreme_document_styling_in_four_reporting_formats/blob/master/unicode.htm

   XLSX
   https://tinyurl.com/y78e7hpt
   https://github.com/rogerjdeangelis/utl_extreme_document_styling_in_four_reporting_formats/blob/master/unicode.xlsx

   DOC
   https://tinyurl.com/y8lwv6nz
   https://github.com/rogerjdeangelis/utl_extreme_document_styling_in_four_reporting_formats/blob/master/unicode.doc

see
Louise S. Hadden, Abt Associates Inc., Cambridge, MA
http://support.sas.com/resources/papers/proceedings10/215-2010.pdf

SAS Forum
https://tinyurl.com/ybblucqs
https://communities.sas.com/t5/Base-SAS-Programming/How-to-make-part-of-the-variable-bold-in-report/m-p/486158


INPUT
=====

  WORK.HAVE total obs=2

   Obs                              NAME (Name is bold re and large)

    1  Roger^{style [color=red fontweight=bold fontsize=18pt]DeAngelis}
    2  Roger^{style [color=red fontweight=bold fontsize=18pt]DeAngelis}


                                    SMILEY

    1  ^{style [fontsize=14pt] ^{unicode 263B} black smiley}
    2  ^{style [fontsize=14pt] ^{unicode 263B} black smiley}

   Obs                             SUNNY

    1  ^{style [fontsize=14pt] ^{unicode 263C} sunny}
    2  ^{unicode 263c} Keeping ^nthe Clouds Away

   Obs                              GIRLY

    1  ^{style [fontsize=14pt COLOR=pink fontweight=bold] ^{unicode 2640} girly}
    2  ^{style [COLOR=pink] ^{unicode 2640} I like Pink!}

   Obs                             MANLY

    1  ^{style [fontsize=14pt COLOR=lightblue] ^{unicode 2642} manly}
    2  ^{style [COLOR=lightblue] ^{unicode 2642} Me Tarzan}



   Obs                          HEART

    1  ^{style [COLOR=red fontsize=14pt] ^{unicode 2665} heart}
    2  ^{style [COLOR=red] I ^{unicode 2665} Tagsets}

   Obs                             DOUBLEDAGGER

    1  ^{style [fontsize=14pt COLOR=blue]^{unicode 2021} doubledeckerdagger}
    2  ^{unicode 2020} If you prick me,^n do I not bleed?


PROCESS

=======
   This creats all four formats;

   * delete files if they exist;
   %utlfkil(d:\tmp\unicode.pdf);
   %utlfkil(d:\tmp\unicode.doc);
   %utlfkil(d:\tmp\unicode.htm);
   %utlfkil(d:\tmp\unicode.xlsx);

   ODS PDF   FILE='d:\tmp\unicode.pdf';
   ODS RTF   FILE='d:\tmp\unicode.doc'    STYLE=styles.astronomy BODYTITLE;
   ODS HTML  FILE='d:\tmp\unicode.htm'    STYLE=styles.journal;
   ods excel FILE='d:\tmp\unicode.xlsx'   STYLE=styles.journal;

   ODS ESCAPECHAR='^';
   PROC PRINT DATA=have LABEL NOOBS;
   VAR name smiley sunny girly manly heart doubledagger;
   TITLE1 HEIGHT=3 '^{style [JUST=c COLOR=purple] ^{unicode beta} Test Unicode in V9.2}';
   TITLE2 HEIGHT=2 COLOR=red '^{super SUPER}' COLOR=blue 'man';
   RUN;QUIT;

   ODS excel CLOSE;
   ODS html CLOSE;
   ODS rtf CLOSE;
   ODS pdf CLOSE;


OUTPUT ( You may have to diwnload)
===================================

   PDF
   https://tinyurl.com/ycf8ofyw

   HTM
   https://tinyurl.com/yc24g5x4

   XLSX
   https://tinyurl.com/y78e7hpt

   DOC
   https://tinyurl.com/y8lwv6nz

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

DATA have;

   firstName='Roger';
   lastName='DeAngelis';
   name=cats(firstName,'^{style [COLOR=RED FONTWEIGHT=BOLD FONTSIZE=18pt]',lastName,'}');
   drop firstName lastName;

   smiley      ='^{style [fontsize=14pt] ^{unicode 263B} black smiley}';
   sunny       ='^{style [fontsize=14pt] ^{unicode 263C} sunny}';
   girly       ='^{style [fontsize=14pt COLOR=pink fontweight=bold] ^{unicode 2640} girly}';
   manly       ='^{style [fontsize=14pt COLOR=lightblue] ^{unicode 2642} manly}';
   heart       ='^{style [COLOR=red fontsize=14pt] ^{unicode 2665} heart}';
   doubledagger='^{style [fontsize=14pt COLOR=blue]^{unicode 2021} doubledeckerdagger}';
   LABEL smiley='^{unicode 263b} Smile,^n Smile,^n Smile!';

   output;

   sunny       ='^{unicode 263c} Keeping ^nthe Clouds Away';
   girly       ='^{style [COLOR=pink] ^{unicode 2640} I like Pink!}';
   manly       ='^{style [COLOR=lightblue] ^{unicode 2642} Me Tarzan}';
   heart       ='^{style [COLOR=red] I ^{unicode 2665} Tagsets}';
   doubledagger='^{unicode 2020} If you prick me,^n do I not bleed?';
   output;

   RUN;quit;







