%%
%% umalayathesis.cls 2017/12/27 version V1.4
%%
%% This is the unofficial UM thesis LaTeX class for postgraduate research
%% students of Universiti Malaya, Malaysia, formatted according to the
%% Guide to the Preparation, Submission and Examination of Theses (2015),
%% published by IPS UM.
%%
%% The latest version and documentation of umalayathesis can be obtained at
%% http://liantze.penguinattack.org/latextypesetting.html#umalayathesis.
%% Contact liantze AT gmail DOT com if you have any questions or
%% assistance or feedback.  Apologies if I can't respond immediately, but
%% I'll always try.
%%
%%
%% Copyright (c) 2011-2016 by Lim Lian Tze
%%
%% Current maintainer: Lim Lian Tze (liantze@gmail.com)
%
%  BRIEF CHANGELOG
%  ===============
% v1.0 June 6 2012
%     - First online release
%
% v1.01 May 31 2012
%     - Fixed the Glossary name
%
% v1.02 September 20 2012
%     - Used Arial Narrow lookalike for the Cover page
%     - Removed extra spacing between acronym entry groups (i.e.
%       extra spacing when the next group of acronyms start with a new
%       alphabet
%     - Removed spurious redundant \vspace*{-4pt} when new appendices
%       chapters are added
%
% v1.03 November 26 2014
%     - Added \msabstractfromfile to incorporate Malay abstract
%
% v1.04 December 29 2014
%     - Made page numbers to be 10pt.
%
% v1.05 September 08 2015
%     - Proper handling of both acronyms and glossaries if required.
%
% v1.1  October 01 2015
%     - Updated ToC and list of symbols/abbrevs formattings (and a
%     - few other minor details) based on latest sample sent by Norsiah.
%     - Now incorporating list of own publications & papers presented.
%
% v1.1.1  October 09 2015
%     - Some fine-tuning requested by IPS when Norsiah tried to submit.
%     - Abstract/Abstract should be CAPITALISED as chapter title but
%       needs to be Title Case in ToC.
%     - Dedication page must not be numbered.
%     - Glossaries, List of Abbreviations, References... are now 12pt
%       (so there's no more need of \backmatter)
%     - Remove the "Appendices" separator page.
%     - Subsubsection should be numbered 1.1.1.1.
%
% v1.1.2  April 30 2016
%     - Float captions are now bold.
%
% v1.2  September 8 2016
%     Well I guess I FINALLY found the updated formatting guide from
%     the Engineering Faculty's webpage, instead of on IPS' webpage!!
%     http://bit.ly/23U6JJV
%     - Added \faculty field
%     - \makecoverandtitlepage now takes an option to output the
%       relevant statement on the title page
%     - Chapter headings are now single line, with less spacing after
%       the chapter title.
%     - Bibliography entries are now explicitly 0.5 inch indented and
%       with really wide double spacing between entries.
%     - \subsubsection heading is now upright and bold.
%     - Re-ordered elements in thesis.tex to match the updated guide.
%     - (Sept 11 2016, small update) Declaration page gets numbered.
%
% v1.3  September 2017
%     - Updated to follow the 2017 IPS Thesis Guidelines at https://www.um.edu.my/docs/librariesprovider80/students-current-students-thesis/10-8-2017---guidelines-for-preparation-of-research-project-dissertation-and-thesis-2017.pdf?sfvrsn=2 and http://um-staging.cloudapp.net:8034/docs/librariesprovider80/students-current-students-thesis/5-ips-160416-v4--thesis-or-dissertation-template.dotx?sfvrsn=2
% v1.4  December 29 2017
%     - Fixed typo matrix -> matric
%     - In ToC etc all long titles are now double-spaced
% v1.4.1 - September 32 2018
%    - Fixed department name for front page
%    - Fixed bahasa melayu title for abstract
%    - Lowered down page number to approximately 1 cm
%    - List of symbols/abbr to be 4cm left margin
%    - List of figure/table to be justified

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{umalayathesis}

%% May 16, 2016: Silence the warnings as they're getting on my nerves
\RequirePackage{silence}
\WarningFilter{babel}{No hyphenation patterns}
\WarningFilter{glossaries}{Overriding}
\WarningFilter{glossaries}{No language module}
\WarningFilter{hyperref}{Token not allowed}

\newif\if@englishthesis\@englishthesisfalse
\DeclareOption{english}{\@englishthesistrue}
\DeclareOption{malay}{\@englishthesisfalse}
\DeclareOption{bahasam}{\@englishthesisfalse}

% Sept 18, 2018 : Yousoff : Fac science will use apacite
\newif\if@apacitethesis\@apacitethesistrue
\newif\if@newapathesis\@newapathesisfalse
\DeclareOption{apacite}{\@apacitethesistrue\@newapathesisfalse}
\DeclareOption{newapa}{\@apacitethesisfalse\@newapathesistrue}
\DeclareOption{custombib}{\@apacitethesisfalse\@newapathesisfalse}

\ExecuteOptions{english,apacite}
\ProcessOptions\relax

\p@=1bp
\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{quoting}
\if@englishthesis
  \RequirePackage[bahasam,main=english]{babel}
\else
  \RequirePackage[main=bahasam,english]{babel}
\fi

% Sept 18, 2018 : Yousoff - Added mtitle for title in Bahasa Melayu
\def\theauthor{\textbf{!INSERT AUTHOR!}}
\def\thetitle{\textbf{!INSERT TITLE!}}
\def\@mtmtitle{\textbf{!INSERT TITLE!}}
\def\@mtfaculty{\textbf{!INSERT FACULTY!}}
\def\@mtsubmissionyear{\textbf{!INSERT YEAR!}}
\def\@mtdegree{\textbf{!INSERT DEGREE!}}

% Sept 18, 2018 : Yousoff - Faculty require department name
\def\@mtdepartment{}

\newcommand{\faculty}[1]{\def\@mtfaculty{#1}}
\newcommand{\submissionyear}[1]{\def\@mtsubmissionyear{#1}}
\newcommand{\degree}[1]{\def\@mtdegree{#1}}
\newcommand{\department}[1]{\def\@mtdepartment{#1}}
\newcommand{\mtitle}[1]{\def\@mtmtitle{#1}}

\def\mastercoursework{1}
\def\mastermixedmode{2}
\def\masterresearch{3}
\def\doctoralresearch{4}
\def\doctoralmixedmode{5}
\def\doctoralcoursework{6}


%%%%%%%%%%%%
% Page layout
%
% Margins: T - 20mm; B - 20mm; L - 40mm; R - 20mm
% No running headers.
% Running footers are 10mm from bottom edge of paper
% i.e. (20 - 10)mm = 10mm from bottom edge of typeblock.
% Page number at right hand side of page

% Sept 18, 2018 : Yousoff - Lower down page number a bit
%%%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{40mm}{20mm}{*}
\setulmarginsandblock{20mm}{20mm+1.25ex}{*}
\setheadfoot{\baselineskip}{10mm}
\addtolength\footskip{1.50ex}
\makeoddfoot{plain}{}{}{\footnotesize\thepage}
\makeevenfoot{plain}{}{}{\footnotesize\thepage}
\pagestyle{plain}
\checkandfixthelayout

%%%%%%%%%%%%
% Simulate MS Windows fonts
% Invoking Helvetica and Times
% NOT Courier because, well, I hate it.
%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\RequirePackage{newtxtext,newtxmath}
%\RequirePackage{mathptmx}
%\RequirePackage{courier}
% \renewcommand\ttdefault{lmvtt}
\RequirePackage{inconsolata}

\RequirePackage[breaklinks,pdfborder={0 0 0},bookmarksdepth=3]{hyperref}

%%%%%%%%%%%%
% Line and paragraph spacing
% - double spacing for normal text
%%%%%%%%%%%%
%\DoubleSpacing
\DisemulatePackage{setspace}
\RequirePackage{setspace}
\setstretch{2.0}
%\abnormalparskip{.5\onelineskip}
\setlength\parindent{0.5cm}

%%%%%%%%%%%%
% Footnotes
% - Font size = 8pt = \tiny for 12pt body font in memoir
% - Double spacing between footnotes
% - v1.3 Flush left
%%%%%%%%%%%%
\renewcommand{\foottextfont}{\tiny}
\setlength\footnotesep{\onelineskip}
\setlength\footmarkwidth{0pt}
\setlength{\footmarksep}{0pt}
\footmarkstyle{\makebox[1em][l]{\textsuperscript{#1}}}

%%%%%%%%%%%%
% 10pt = \footnotesize for backmatter
%%%%%%%%%%%%
\patchcommand{\backmatter}{}{\footnotesize}


%%%%%%%%%%%%
% The Cover and Title page
%%%%%%%%%%%%
% May 16, 2016: Overhauled re the 2015 guidelines
\newcommand{\makecoverandtitlepage}[1]{%
  \let\thesis@type=#1
  \ignorespaces
  \changepage{-60mm+1.25ex}{-20mm}{20mm}{0pt}{0pt}{30mm}{0pt}{0pt}{0pt}
  \hypersetup{pageanchor=false}
  \begin{titlingpage}%
    \setSingleSpace{1.15}\SingleSpacing%
    \centering%
    % \renewcommand\ttdefault{lmtt}%
    \fontfamily{qhvc}\fontseries{b}\fontsize{16\p@}{18\p@}\selectfont%
    \MakeUppercase{\thetitle}\par%
    \vfill%
    \MakeUppercase{\theauthor}\par%
    \vfill%
    \MakeUppercase{\@mtfaculty}\\%
    UNIVERSITY OF MALAYA\\%
    KUALA LUMPUR\par%
    \bigskip%
    \@mtsubmissionyear\par%
  \end{titlingpage}%
  \hypersetup{pageanchor=true}
  { \setSingleSpace{1.15}\SingleSpacing%
    \centering\thispagestyle{empty}\setcounter{page}{1}%
    \fontsize{14\p@}{16\p@}\selectfont\bfseries%
    % \renewcommand\ttdefault{lmtt}%
    \MakeUppercase{\thetitle}\par%
    \vfill%
    {\MakeUppercase{\theauthor}\par}%
    \vfill%
    \ifcase\thesis@type
      \or % 1 -- mastercoursework
        \statement@mastercoursework%
      \or % 2 -- mastermixedmode
        \statement@mastermixedmode%
      \or % 3 -- masterresearch
        \statement@masterresearch%
      \or % 4 -- doctoralresearch
        \statement@doctoralresearch
      \or % 5 -- doctoralmixedmode
        \statement@doctoralmixedmode
      \or % 6 -- doctoralcoursework
        \statement@doctoralcoursework
    \fi%
    \vfill%
    \@mtsubmissionyear%\\[3em]%
    \par\clearpage%
  }
  \changepage{60mm-1.25ex}{20mm}{-20mm}{0pt}{0pt}{-30mm}{0pt}{0pt}{0pt}
  % \renewcommand\ttdefault{lmvtt}%
}

\newcommand\statement@mastercoursework{%
  RESEARCH PROJECT SUBMITTED TO THE\\\MakeUppercase{\@mtfaculty}\\%
  UNIVERSITY OF MALAYA, IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE DEGREE OF \MakeUppercase{\@mtdegree}%
}

\newcommand\statement@mastermixedmode{%
  DISSERTATION SUBMITTED IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE DEGREE OF \MakeUppercase{\@mtdegree}%
  \vfill\faculty@block%
}

\newcommand\statement@masterresearch{%
  DISSERTATION SUBMITTED IN FULFILMENT OF THE REQUIREMENTS FOR THE DEGREE OF \MakeUppercase{\@mtdegree}%
  \vfill\faculty@block%
}

\newcommand\statement@doctoralresearch{%
  THESIS SUBMITTED IN FULFILMENT OF THE REQUIREMENTS FOR THE DEGREE OF \MakeUppercase{\@mtdegree}%
  \vfill\faculty@block%
}

\newcommand\statement@doctoralmixedmode{%
  THESIS SUBMITTED IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE DEGREE OF \MakeUppercase{\@mtdegree}%
  \vfill\faculty@block%
}

\newcommand\statement@doctoralcoursework{%
  DISSERTATION SUBMITTED IN PARTIAL FULFILMENT OF THE REQUIREMENTS FOR THE DEGREE OF \MakeUppercase{\@mtdegree}%
  \vfill\faculty@block%
}

\newcommand\faculty@block{%
  \ifx \@mtdepartment \empty

  \else
     \MakeUppercase{\@mtdepartment}\\
  \fi
 
  \MakeUppercase{\@mtfaculty}\\
  UNIVERSITY OF MALAYA\\
  KUALA LUMPUR%
}

%%%%%%%%%%%%
% The Declaration page
%%%%%%%%%%%%
\newcommand{\declarationpage}{%
  % 1 Oct: declaration page no longer included in ToC
  % v1.3: Alternates between English/Malay
  \if@englishthesis
    \english@declaration@page
  \else
    \malay@declaration@page
  \fi
}

\newcommand{\english@declaration@page}{%
  \chapter*{Universiti Malaya\vskip1em Original Literary Work Declaration}
  %\chapter[Original Literary Work Declaration]{{\large Universiti Malaya}\vskip1em Original Literary Work Declaration}
  {%\large%
    \noindent Name of Candidate: \hfill (I.C./Passport No.:\hspace{10em})\par
    \noindent Registration/Matric No.:\par
    \noindent Name of Degree:\par
    \noindent Title of Project Paper/Research Report/Dissertation/Thesis (``this Work''):\vskip 3em\par
    \noindent Field of Study:\par

    {\SingleSpacing\setSingleSpace{1.15}
    I do solemnly and sincerely declare that:

    % \setlength\pltopsep{1em}
    \begin{enumerate}[noitemsep,label=(\arabic*)]
    \item I am the sole author/writer of this Work;
    \item This work is original;
    \item Any use of any work in which copyright exists was done by way of fair dealing and for permitted purposes and any excerpt or extract from, or reference to or reproduction of any copyright work has been disclosed expressly and sufficiently and the title of the Work and its authorship have been acknowledged in this Work;
    \item I do not have any actual knowledge nor do I ought reasonably to know that the making of this work constitutes an infringement of any copyright work;
    \item I hereby assign all and every rights in the copyright to this Work to the University of
    Malaya (``UM''), who henceforth shall be owner of the copyright in this Work and that any
    reproduction or use in any form or by any means whatsoever is prohibited without the
    written consent of UM having been first had and obtained;
    \item I am fully aware that if in the course of making this Work I have infringed any copyright
    whether intentionally or otherwise, I may be subject to legal action or any other action
    as may be determined by UM.
    \end{enumerate}
    }

    \vfill

    Candidate's Signature \hfill Date:\hspace{6em}
    \vskip 3em

    \noindent Subscribed and solemnly declared before,\vskip 3em

    Witness's Signature \hfill Date:\hspace{6em}

    {\SingleSpacing\small
    \noindent Name:\par
    \noindent Designation:\par}
  }
\clearpage}


\newcommand{\malay@declaration@page}{%
  \chapter*{Universiti Malaya\vskip1em Perakuan Keaslian Penulisan}
  %\chapter[Original Literary Work Declaration]{{\large Universiti Malaya}\vskip1em Original Literary Work Declaration}
  {%\large%
    \otherlanguage{bahasam}
    \noindent Nama: \hfill (No.~K.P./Pasport:\hspace{10em})\par
    \noindent No.~Matrik:\par
    \noindent Nama Ijazah:\par
    \noindent Tajuk Kertas Projek/Laporan Penyelidikan/Disertasi/Tesis (``Hasil Kerja ini''):\vskip 1em\par
    \noindent Bidang Penyelidikan:\par

    {\SingleSpacing\setSingleSpace{1.15}
    Saya dengan sesungguhnya dan sebenarnya mengaku bahawa:

    % \setlength\pltopsep{1em}
    \begin{enumerate}[noitemsep,label=(\arabic*),leftmargin=3em]
    \item Saya adalah satu-satunya pengarang/penulis Hasil Kerja ini;
    \item Hasil Kerja ini adalah asli;
    \item Apa-apa penggunaan mana-mana hasil kerja yang mengandungi hakcipta telah dilakukan secara urusan yang wajar dan bagi maksud yang dibenarkan dan apa-apa petikan, ekstrak, rujukan atau pengeluaran semula daripada atau kepada mana-mana hasil kerja yang mengandungi hakcipta telah dinyatakan dengan sejelasnya dan secukupnya dan satu pengiktirafan tajuk hasil kerja tersebut dan pengarang/penulisnya telah dilakukan di dalam Hasil Kerja ini;
    \item Saya tidak mempunyai apa-apa pengetahuan sebenar atau patut semunasabahnya tahu bahawa penghasilan Hasil Kerja ini melanggar suatu hakcipta hasil kerja yang lain;
    \item Saya dengan ini menyerahkan kesemua dan tiap-tiap hak yang terkandung di dalam hakcipta Hasil Kerja ini kepada Universiti Malaya (``UM'') yang seterusnya mula dari sekarang adalah tuan punya kepada hakcipta di dalam Hasil Kerja ini dan apa-apa pengeluaran semula atau penggunaan dalam apa jua bentuk atau dengan apa juga cara sekalipun adalah dilarang tanpa terlebih dahulu mendapat kebenaran bertulis dari UM;
    \item Saya dengan ini menyerahkan kesemua dan tiap-tiap hak yang terkandung di dalam hakcipta Hasil Kerja ini kepada Universiti Malaya (``UM'') yang seterusnya mula dari sekarang adalah tuan punya kepada hakcipta di dalam Hasil Kerja ini dan apa-apa pengeluaran semula atau penggunaan dalam apa jua bentuk atau dengan apa juga cara sekalipun adalah dilarang tanpa terlebih dahulu mendapat kebenaran bertulis dari UM.
    \end{enumerate}
    }

    Tandatangan Calon \hfill Tarikh:\hspace{6em}

    \noindent Diperbuat dan sesungguhnya diakui di hadapan,

    Tandatangan Saksi \hfill Tarikh:\hspace{6em}

    {\SingleSpacing\small
    \noindent Nama:\par
    \noindent Jawatan:\par}
  }
\clearpage}

%%%%%%%%%%%%
% The Acknowledgements (typeset like chapter?)
%%%%%%%%%%%%
\if@englishthesis
  \newcommand{\acknowlname}{Acknowledgements}
\else
  \newcommand{\acknowlname}{Pengakuan}
\fi
\newcommand{\acknowledgements}[1]{\chapter{\acknowlname}#1}

%%%%%%%%%%%%
% The dedication (??? formatting???)
%%%%%%%%%%%%
\newcommand{\dedication}[1]{\newpage\hspace{1em}%
\phantomsection%
\currentpdfbookmark{Dedication}{dedication}%
\cftaddtitleline{toc}{chapter}{Dedication}{\thepage}%
\begin{vplace}[.5]\centering#1\end{vplace}%
\clearpage}


%%%%%%%%%%%%
% The Abstract
%%%%%%%%%%%%
%% \abstractintoc
%% October 01, 2015: don't capitalise front matter titles
\renewcommand*\absnamepos{center}
\setlength\abstitleskip{0pt}
\renewcommand\abstractnamefont{\normalsize\bfseries}
\renewcommand\abstracttextfont{\normalsize}
\setlength\absleftindent{0pt}
\setlength\absrightindent{0pt}
\newcommand{\abstractfromfile}[1]{
  \clearpage%
  \if@englishthesis
    \renewcommand*\abstractname{\MakeUppercase{\thetitle}\par ABSTRACT}
  \else
    \renewcommand*\abstractname{\MakeUppercase{\thetitle}\par ABSTRACT}
  \fi
  \phantomsection\addcontentsline{toc}{chapter}{Abstract}
  \begin{abstract}\setlength{\parindent}{0pt}\noindent\input{#1}\end{abstract}
}
%% October 01, 2015: no longer need to capitalise in ToC
% Sept 18, 2018 : Yousoff - Added title in Bahasa Melayu in abstract
\newcommand{\msabstractfromfile}[1]{%
  \clearpage%
  \if@englishthesis
    \renewcommand*\abstractname{\MakeUppercase{\@mtmtitle}\par ABSTRAK}
  \else
    \renewcommand*\abstractname{\MakeUppercase{\@mtmtitle}\par ABSTRAK}
  \fi
  \phantomsection\addcontentsline{toc}{chapter}{Abstrak}
  \begin{abstract}\otherlanguage{bahasam}\setlength{\parindent}{0pt}\noindent\input{#1}\end{abstract}
}

%%%%%%%%%%%%
% The Preface
%%%%%%%%%%%%
\newenvironment{preface}{\chapter{Preface}}{}
\newcommand{\prefacefromfile}[1]{\begin{preface}\input{#1}\end{preface}}

%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
%% 3 May 2016: One-line chapter title
\renewcommand\chapterheadstart{\bgroup\SingleSpacing\normalsize\vskip\beforechapskip}
\appto{\afterchaptertitle}{\egroup}
\setlength\beforechapskip{0pt}
\setlength\midchapskip{2\onelineskip}
\setlength\afterchapskip{\onelineskip}
\renewcommand*\chapnamefont{\normalsize\bfseries}
\renewcommand*\chapnumfont{\normalsize\bfseries\centering}
\renewcommand*\chaptitlefont{\normalsize\bfseries\centering}
\renewcommand*{\afterchapternum}{: }
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand*{\printchaptertitle}[1]{{\chaptitlefont\MakeUppercase{#1}\par}}


%%%%%%%%%%%%
% The Appendices
%%%%%%%%%%%%
%% October 01, 2015: no need to capitalise front and back matter chapter titles
% \renewcommand\appendixtocname{Appendices}
\if@englishthesis
  % \renewcommand*\appendixname{Appendix}
  % \renewcommand\appendixtocname{Appendices}
  \newcommand{\listappname}{List of Appendices}
\else
  % \renewcommand*\appendixname{Apendiks}
  % \renewcommand\appendixtocname{Apendiks}
  \newcommand{\listappname}{Senarai Lampiran}
\fi
\newlistof{listofappendices}{apx}{\listappname}
\addtodef\appendix{}{\renewcommand\chaptername{\appendixname}}
\def\app@chapter[#1]#2{%
  \m@mpn@new@chaptrue%
  \m@mpn@new@schapfalse%
  \def\f@rbdy{#2}%
  \ifx\ch@pt@c\@empty % no optional args
    \def\f@rtoc{#2}%
    \def\f@rhdr{#2}%
  \else                  % at least one opt arg
    \let\f@rtoc\ch@pt@c
    \ifx\@empty#1\@empty
      \let\f@rhdr\ch@pt@c
    \else
      \def\f@rhdr{#1}%
    \fi
  \fi
  \m@m@Andfalse
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
      \m@m@Andtrue
    \fi
  \fi
  \ifm@m@And
    \refstepcounter{chapter}%
  \fi
  \ifartopt
    \@makechapterhead{#2}%
    \@afterheading
    \chaptermark{\f@rhdr}%
  \else
    \chaptermark{\f@rhdr}
    \insertchapterspace
    \if@twocolumn
      \@topnewpage[\@makechapterhead{#2}]%
    \else
      \@makechapterhead{#2}%
    \fi
    \@afterheading
  \fi
  \ifm@m@And
    \ifanappendix
      \addcontentsline{apx}{appendix}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memappchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \addcontentsline{apx}{chapter}{%
        \protect\chapternumberline{\thechapter}\f@rtoc}%
      \memchapinfo{\thechapter}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \else
    \addcontentsline{apx}{chapter}{\f@rtoc}%
    \ifanappendix
      \memappchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \else
      \memchapinfo{}{\f@rtoc}{\f@rhdr}{#2}%
    \fi
  \fi
  \ifheadnameref\M@gettitle{\f@rhdr}\else\M@gettitle{\f@rtoc}\fi}

\newcommand*{\startapps}{%
  \cftinserthook{toc}{PlainChapTocLines}
  \cftinserthook{apx}{AppendixToCLines}
  \clearpage\appendix%\appendixpage%
  \phantomsection\addcontentsline{toc}{chapter}{\appendixtocname}
  \let\@chapter\app@chapter % use \app@chapter instead of \@chapter
  \renewcommand\mychap[1]{\orichapter{##1}}
  \settocdepth{chapter}% stop sections being in the ToC
  \renewcommand{\insertchapterspace}{\oldinsertchapterspace}
}
\newcommand*{\finishapps}{%
%% October 01, 2015: no need to capitalise back matter chapter titles
%  \renewcommand\mychap[1]{\orichapter[\texorpdfstring{\MakeUppercase{##1}}{##1}]{##1}}
  \settocdepth{subsubsection}% sections back in ToC
}
\cftinsertcode{AppendixToCLines}{%
  \renewcommand*\cftchapteraftersnum{:\space}%
  \setlength\cftchapternumwidth{2em}%
  \renewcommand*\cftchapterfont{\normalfont\mdseries\upshape}%
  \renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}%
}

%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
% v1.3: indents first line of paragraph immediately after headings
\RequirePackage{titlesec}
\indentafterchapter
\setsecnumdepth{paragraph}
\renewcommand{\theparagraph}{(\alph{paragraph})}
\titleformat{\section}[hang]{\SingleSpacing\normalsize\bfseries}
    {\makebox[4em][l]{\thesection}}{0pt}{}
\titlespacing{\section}{0pt}{2.5ex plus 1ex minus .2ex}{0.1ex plus .2ex}
\titleformat{\subsection}[hang]{\SingleSpacing\normalsize\bfseries}
    {\makebox[4em][l]{\thesubsection}}{0pt}{}
\titlespacing{\subsection}{0pt}{2.5ex plus 1ex minus .2ex}{0.1ex plus .2ex}
\titleformat{\subsubsection}[hang]{\SingleSpacing\normalsize\bfseries}
    {\makebox[4em][l]{\thesubsubsection}}{0pt}{}
\titlespacing{\subsubsection}{0pt}{2.5ex plus 1ex minus .2ex}{0.1ex plus .2ex}
\titleformat{\paragraph}[hang]{\SingleSpacing\normalsize\mdseries}
    {\theparagraph}{1em}{\itshape\bfseries}
\titlespacing{\paragraph}{0pt}{2.5ex plus 1ex minus .2ex}{0.1ex plus .2ex}
% \setsecheadstyle{\SingleSpacing\normalsize\bfseries}
% \setbeforesecskip{2.5ex plus 1ex minus .2ex}
% \setaftersecskip{0.1ex plus .2ex}
% \setsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
% \setbeforesubsecskip{2.5ex plus 1ex minus .2ex}
% \setaftersubsecskip{0.1ex plus .2ex}
% \setsubsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
% \setbeforesubsubsecskip{2.5ex plus .2ex minus .2ex}
% \setaftersubsubsecskip{0.1ex plus .2ex}
% \setbeforeparaskip{2.5ex plus .2ex minus .2ex}
% \setafterparaskip{0.1ex plus .2ex}

%%%%%%%%%%%
% Enable Subfloats
%%%%%%%%%%%
\newsubfloat{figure}
\newsubfloat{table}
\setcounter{lofdepth}{2}
\setcounter{lotdepth}{2}

%%%%%%%%%%%
% ToC etc
%%%%%%%%%%%
\settocdepth{subsubsection}
%% October 01, 2015: we want dot leaders now!
% \renewcommand\cftdotsep{\cftnodots}
\renewcommand\cftdotsep{0}
\renewcommand{\cftchapterleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftfigureleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cfttableleader}{\cftdotfill{\cftdotsep}}
% \renewcommand{\cftapxleader}{\cftdotfill{\cftdotsep}}

% Sept 18, 2018 : Yousoff - Faculty want ToC to be justified ~ roughly 7mm from the right
\setrmarg{7mm}
%\setrmarg{3.55em plus 1fil}
\renewcommand*{\cftchaptername}{\MakeUppercase{\chaptername}\space}
\renewcommand*{\cftchapteraftersnum}{:\space}
%\renewcommand*{\cftchapterafterpnum}{\vspace*{4pt}}
\renewcommand*{\cftappendixname}{\appendixname\space}
\setlength\cftsectionindent{0pt}
\let\orichapter\chapter
%% October 01, 2015: delay until \mainmatter
%\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}
\newcommand\mychap[2][]{\orichapter%
[\ifstrempty{#1}{\texorpdfstring{\MakeUppercase{#2}}{#2}}%
{\texorpdfstring{\MakeUppercase{#1}}{#1}}]%
{#2}}
\newcommand\mystarchap[1]{\orichapter*{#1}}
%\renewcommand*\cftsectionafterpnum{\vskip 3pt}
\setlength{\cftbeforechapterskip}{0pt}
\setlength\cftsubsectionindent{\cftsectionnumwidth}
\setlength\cftbeforesectionskip{0pt}
\setlength\cftbeforesubsectionskip{0pt}
% v1.3 (Sep 2017): subsubsections in ToC
\setlength\cftsubsubsectionindent{\cftsubsectionnumwidth}
\addtolength{\cftsubsubsectionindent}{\cftsubsectionindent}
\setlength\cftbeforesubsubsectionskip{0pt}

% October 01, 2015: need a : after the number; no more extra space
\renewcommand*\cftfigurename{\figurename\space}
\renewcommand*\cfttablename{\tablename\space}
\renewcommand*\cftfigureaftersnum{:\space}
\renewcommand*\cfttableaftersnum{:\space}
%\renewcommand*\cftfigureafterpnum{\vskip 3pt}
%\renewcommand*\cfttableafterpnum{\vskip 3pt}
\setlength\cftbeforefigureskip{0pt}
\setlength\cftbeforesubfigureskip{0pt}
\renewcommand*\cftsubfigureaftersnum{\space}
\newlength{\tmplength}
\settowidth{\tmplength}{\normalfont\cftfigurename}
\addtolength{\tmplength}{\cftfigurenumwidth}
\cftsetindents{subfigure}{\tmplength}{1.5em}
\setlength\cftbeforetableskip{0pt}
\setlength\cftbeforesubtableskip{0pt}
\renewcommand*\cftsubtableaftersnum{\space}
\settowidth{\tmplength}{\normalfont\cfttablename}
\addtolength{\tmplength}{\cfttablenumwidth}
\cftsetindents{subtable}{\tmplength}{1.5em}

\let\oldinsertchapterspace\insertchapterspace
\cftinsertcode{MainChapTocLines}{%
  \renewcommand*\cftchapterfont{\normalfont\bfseries\upshape}%
  \renewcommand*\cftchapterpagefont{\normalfont\bfseries\upshape}%
}
\cftinsertcode{PlainChapTocLines}{%
  \renewcommand*\cftchapterfont{\normalfont\mdseries\upshape}%
  \renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}%
}

\apptocmd{\frontmatter}{%
  \cftinserthook{toc}{PlainChapTocLines}%
}{}{}
\apptocmd{\mainmatter}{
  \addtodef{\insertchapterspace}{}%
{\addtocontents{toc}{\protect\vspace*{\baselineskip}}}%
  \cftinserthook{toc}{MainChapTocLines}%
  \renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}%
}{}{}

%%%%%%%%%%%
% Indexing
%%%%%%%%%%%
%\RequirePackage{makeidx}
%\makeindex

%%%%%%%%%%%
% Quotes
%%%%%%%%%%%
\quotingsetup{leftmargin=0.5in,indentfirst=false}
\let\quote\quoting
\let\endquote\endquoting
\let\quotation\quoting
\let\endquotation\endquotation

%%%%%%%%%%%
% List Indent
%%%%%%%%%%%
\setlist{noitemsep}
\setlist[1]{labelindent=1cm,leftmargin=*,labelwidth=*}

%%%%%%%%%%%%
% Bibliograpy
% - Font size = 10pt = \footnotesize
% - Double spacing between entries
%%%%%%%%%%%%
% v1.3: Refactor this to make it easier to switch bibliography styles
\if@apacitethesis
  \RequirePackage[nosectionbib]{apacite}
  \bibliographystyle{apacite}
  %\renewcommand\bibliographytypesize{\footnotesize}
  \setlength\bibitemsep{2\onelineskip}
  % May 16, 2016: explicitly set to 0.5in hang
  \setlength\bibleftmargin{0.5in}
  \setlength\bibindent{-0.5in}
\fi

\if@newapathesis
  \RequirePackage{natbib}
  \bibliographystyle{newapa}
\fi

\AtBeginDocument{%
  \@ifpackageloaded{natbib}{%
    \setlength\bibsep{2\onelineskip}
    \setlength\bibhang{0.5in}
  }{}
  \pretocmd{\bibliography}{%
  \addtocontents{toc}{%
    \protect\renewcommand*\protect\cftchapterfont{\normalfont\mdseries\upshape}%
    \protect\renewcommand*\protect\cftchapterpagefont{\normalfont\mdseries\upshape}%
    }%
  }{}{}
  %% October 01, 2015: Don't capitalise backmatter chapter titles
  \renewcommand*\bibname{References}
}

\patchcommand{\bibitem}{\SingleSpacing}{}{}


%% October 01: Added list of own publications
\RequirePackage[resetlabels]{multibib}
\if@englishthesis
  \newcommand{\listpubname}{List of Publications and Papers Presented}
\else
  \newcommand{\listpubname}{Senarai Terbitan dan Kertas Kerja Dibentang}
\fi
\newcites{own}{\listpubname}
\if@apacitethesis
  \bibliographystyleown{apacite}
\fi
\if@newapathesis
  \bibliographystyleown{newapa}
\fi
%\addtoiargdef{\bibliographyown}{}{\renewcommand*\refname{List of Publications and Papers Presented}}

\RequirePackage{relsize}
%% Sept 08, 2015: added "acronym" option
% Sept 18, 2018 : Yousoff - Acronym to be single space
% and roughly 4cm for left margin
\RequirePackage[toc,nonumberlist,shortcuts,translate=false,style=long,acronym]{glossaries}
\RequirePackage{glossaries-babel}
%\renewcommand*{\acrnameformat}[2]{#2 (\acronymfont{#1})}
\renewcommand*{\glsgroupskip}{}
\setglossarypreamble[acronym]{\renewcommand*{\arraystretch}{1.2}\SingleSpacing}
\setglossarypreamble{\renewcommand*{\arraystretch}{1.2}\SingleSpacing}
%\setglossarypreamble{\renewcommand*{\arraystretch}{1.2}\SingleSpacing}
\makeglossaries
%\newcommand\listacrname{List of Symbols and Acronyms}
\setlength\LTleft{-2mm}
\setlength\LTright{0pt}
\setlength\glsdescwidth{1\hsize}
\newcommand\listofacronyms{%
  %% Oct 02: List of acronyms is normalsized and with a colon
  \renewcommand{\glsnamefont}[1]{##1\hfill\space:}%
  \printglossary[type=\acronymtype]%
  \renewcommand{\glsnamefont}[1]{##1}%
}
% October 01, 2015: No longer need to capitalise front-matter chapter titles
\addto\captionsenglish{%
  \renewcommand*\abstractname{Abstract}
  \renewcommand*\contentsname{Table of Contents}
  \renewcommand*\listtablename{List of Tables}
  \renewcommand*\listfigurename{List of Figures}
  \renewcommand*\appendixname{Appendix}
  \renewcommand\appendixtocname{Appendices}
  \renewcommand*\indexname{Index}
  %% September 08, 2015: Changed \glossaryname to \acronymname
  %% October 01, 2015: "Abbreviations" instead
  \renewcommand*\acronymname{List of Symbols and Abbreviations}
}

% v1.3
\addto\captionsbahasam{%
  \renewcommand*\acronymname{Senarai Simbol dan Ringkasan}
  \renewcommand*\appendixname{Lampiran}
  \renewcommand\appendixtocname{Lampiran}
}

%% April 30, 2016: Bold captions
\captionnamefont{\bfseries\normalsize}
\captiontitlefont{\bfseries\normalsize}
