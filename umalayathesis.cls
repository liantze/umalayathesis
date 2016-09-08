%%
%% umalayathesis.cls 2016/09/08 version V1.2
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

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{umalayathesis}

%% May 16, 2016: Silence the warnings as they're getting on my nerves
\RequirePackage{silence}
\WarningFilter{babel}{No hyphenation patterns}
\WarningFilter{glossaries}{Overriding}
\WarningFilter{glossaries}{No language module}


\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{paralist}
\RequirePackage[bahasam,english]{babel}

\def\theauthor{\textbf{!INSERT AUTHOR!}}
\def\thetitle{\textbf{!INSERT TITLE!}}
\def\@mtfaculty{\textbf{!INSERT FACULTY!}}
\def\@mtsubmissionyear{\textbf{!INSERT YEAR!}}
\def\@mtdegree{\textbf{!INSERT DEGREE!}}

\newcommand{\faculty}[1]{\def\@mtfaculty{#1}}
\newcommand{\submissionyear}[1]{\def\@mtsubmissionyear{#1}}
\newcommand{\degree}[1]{\def\@mtdegree{#1}}

\def\mastercoursework{1}
\def\mastermixedmode{2}
\def\masterresearch{3}
\def\doctoralresearch{4}
\def\doctoralmixedmode{5}


%%%%%%%%%%%%
% Page layout
%
% Margins: T - 20mm; B - 20mm; L - 40mm; R - 20mm
% No running headers.
% Running footers are 10mm from bottom edge of paper
% i.e. (20 - 10)mm = 10mm from bottom edge of typeblock.
% Page number at right hand side of page
%%%%%%%%%%%%
\settrimmedsize{297mm}{210mm}{*}
\setlrmarginsandblock{40mm}{20mm}{*}
\setulmarginsandblock{20mm}{20mm+1.25ex}{*}
\setheadfoot{\baselineskip}{10mm}
\addtolength\footskip{1.25ex}
\makeoddfoot{plain}{}{}{\footnotesize\thepage}
\makeevenfoot{plain}{}{}{\footnotesize\thepage}
\pagestyle{plain}
\checkandfixthelayout

%%%%%%%%%%%%
% Simulate MS Windows fonts
% Invoking Helvetica and Times
% NOT Courier because, well, I hate it.
%
% TODO: TeX Gyre fonts + Math Times Pro with "altfonts" option
%%%%%%%%%%%%
\RequirePackage[T1]{fontenc}
\RequirePackage[scaled]{helvet}
\RequirePackage{newtxtext,newtxmath}
%\RequirePackage{mathptmx}
%\RequirePackage{courier}
\renewcommand\ttdefault{lmvtt}

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
\setlength\parindent{2em}

%%%%%%%%%%%%
% Footnotes
% - Font size = 8pt = \tiny for 12pt body font in memoir
% - Double spacing between footnotes
%%%%%%%%%%%%
\renewcommand{\foottextfont}{\tiny}
\setlength\footnotesep{\onelineskip}


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
  \begin{titlingpage}%
    \setSingleSpace{1.15}\SingleSpacing%
    \centering%
    \renewcommand\ttdefault{lmtt}%
    \fontfamily{phv}\fontseries{mc}\fontsize{16pt}{18pt}\selectfont%
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
  { \setSingleSpace{1.15}\SingleSpacing%
    \centering\thispagestyle{empty}\setcounter{page}{1}%
    \fontsize{16pt}{18pt}\selectfont%
    \renewcommand\ttdefault{lmtt}%
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
    \fi
    \vfill%
    \@mtsubmissionyear%\\[3em]%
    \par\clearpage%
  }
  \changepage{60mm-1.25ex}{20mm}{-20mm}{0pt}{0pt}{-30mm}{0pt}{0pt}{0pt}
  \renewcommand\ttdefault{lmvtt}%
}

\newcommand\statement@mastercoursework{%
  SUBMITTED TO THE\\\MakeUppercase{\@mtfaculty}\\
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

\newcommand\faculty@block{%
  \MakeUppercase{\@mtfaculty}\\
  UNIVERSITY OF MALAYA\\
  KUALA LUMPUR%
}

%%%%%%%%%%%%
% The Declaration page
%%%%%%%%%%%%
\newcommand{\declarationpage}{%
  % 1 Oct: declaration page no longer included in ToC
  \chapter*{{\large Universiti Malaya}\vskip1em Original Literary Work Declaration}
  %\chapter[Original Literary Work Declaration]{{\large Universiti Malaya}\vskip1em Original Literary Work Declaration}
  {%\large%
    \noindent Name of Candidate: \hfill (I.C./Passport No.:\hspace{10em})\par
    \noindent Registration/Matrix No.:\par
    \noindent Name of Degree:\par
    \noindent Title of Project Paper/Research Report/Dissertation/Thesis (``this Work''):\vskip 3em\par
    \noindent Field of Study:\par

    {\SingleSpacing\setSingleSpace{1.15}
    I do solemnly and sincerely declare that:

    \setlength\pltopsep{1em}
    \begin{compactenum}[(1)]
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
    \end{compactenum}
    }

    \vfill

    Candidate's Signature \hfill Date \hspace{6em}
    \vskip 3em

    \noindent Subscribed and solemnly declared before,\vskip 3em

    Witness's Signature \hfill Date \hspace{6em}

    {\SingleSpacing\small
    \noindent Name:\par
    \noindent Designation:\par}
  }
\clearpage}

%%%%%%%%%%%%
% The Acknowledgements (typeset like chapter?)
%%%%%%%%%%%%
\newcommand{\acknowledgements}[1]{\chapter{Acknowledgements}#1}

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
  \renewcommand*\abstractname{ABSTRACT}
  \phantomsection\addcontentsline{toc}{chapter}{Abstract}
  \begin{abstract}\input{#1}\end{abstract}
}
%% October 01, 2015: no longer need to capitalise in ToC
\newcommand{\msabstractfromfile}[1]{%
  \clearpage%
  \renewcommand*\abstractname{ABSTRAK}
  \phantomsection\addcontentsline{toc}{chapter}{Abstrak}
  \begin{abstract}\otherlanguage{bahasam}\input{#1}\end{abstract}
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
\renewcommand*\appendixname{Appendix}
%% October 01, 2015: no need to capitalise front and back matter chapter titles
\renewcommand\appendixtocname{Appendices}
\newlistof{listofappendices}{apx}{List of Appendices}
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
  \phantomsection\addcontentsline{toc}{chapter}{Appendices}
  \let\@chapter\app@chapter % use \app@chapter instead of \@chapter 
  \renewcommand\mychap[1]{\orichapter{##1}}
  \settocdepth{chapter}% stop sections being in the ToC 
  \renewcommand{\insertchapterspace}{\oldinsertchapterspace}
} 
\newcommand*{\finishapps}{% 
%% October 01, 2015: no need to capitalise back matter chapter titles
%  \renewcommand\mychap[1]{\orichapter[\texorpdfstring{\MakeUppercase{##1}}{##1}]{##1}}
  \settocdepth{section}% sections back in ToC 
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
\setsecnumdepth{subsubsection}
\setsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesecskip{-2.5ex plus 1ex minus .2ex}
\setaftersecskip{0.1ex plus .2ex}
\setsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsecskip{-2.5ex plus 1ex minus .2ex}
\setaftersubsecskip{0.1ex plus .2ex}
\setsubsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsubsecskip{-2.5ex plus .2ex minus .2ex}
\setaftersubsubsecskip{0.1ex plus .2ex}


%%%%%%%%%%%
% ToC etc
%%%%%%%%%%%
\settocdepth{subsection}
%% October 01, 2015: we want dot leaders now!
% \renewcommand\cftdotsep{\cftnodots}
\renewcommand\cftdotsep{0}
\renewcommand{\cftchapterleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftfigureleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cfttableleader}{\cftdotfill{\cftdotsep}}
% \renewcommand{\cftapxleader}{\cftdotfill{\cftdotsep}}
\setrmarg{3.55em plus 1fil}
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
\setlength\cftsubsectionindent{\cftsectionnumwidth}
\setlength\cftbeforesectionskip{1em}
\setlength\cftbeforesubsectionskip{1em}

% October 01, 2015: need a : after the number; no more extra space
\renewcommand*\cftfigurename{\figurename\space}
\renewcommand*\cfttablename{\tablename\space}
\renewcommand*\cftfigureaftersnum{:\space}
\renewcommand*\cfttableaftersnum{:\space}
%\renewcommand*\cftfigureafterpnum{\vskip 3pt}
%\renewcommand*\cfttableafterpnum{\vskip 3pt}
\setlength\cftbeforefigureskip{1em}
\setlength\cftbeforetableskip{1em}

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

%%%%%%%%%%%%
% Bibliograpy
% - Font size = 10pt = \footnotesize
% - Double spacing between entries
%%%%%%%%%%%%
\RequirePackage[nosectionbib]{apacite}
\newcounter{lbibcount}
\bibliographystyle{apacite}
%\renewcommand\bibliographytypesize{\footnotesize}
\setlength\bibitemsep{2\onelineskip}
% May 16, 2016: explicitly set to 0.5in hang
\setlength\bibleftmargin{0.5in}
\setlength\bibindent{-0.5in}

\patchcommand{\bibitem}{\SingleSpacing}{}
%% October 01, 2015: Don't capitalise backmatter chapter titles
\AtBeginDocument{\renewcommand*\bibname{References}}

%% October 01: Added list of own publications
\RequirePackage{multibib}
\newcites{own}{List of Publications and Papers Presented}
\bibliographystyleown{apacite}
%\addtoiargdef{\bibliographyown}{}{\renewcommand*\refname{List of Publications and Papers Presented}}

\RequirePackage{relsize}
%% Sept 08, 2015: added "acronym" option
\RequirePackage[toc,nonumberlist,shortcuts,translate=false,style=long,acronym]{glossaries}
\RequirePackage{glossaries-babel}
%\renewcommand*{\acrnameformat}[2]{#2 (\acronymfont{#1})}
\renewcommand*{\glsgroupskip}{}
\setglossarypreamble[acronym]{\renewcommand*{\arraystretch}{1.2}\SingleSpacing}
\setglossarypreamble{\renewcommand*{\arraystretch}{1.2}\SingleSpacing}
\makeglossaries
%\newcommand\listacrname{List of Symbols and Acronyms}
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
  \renewcommand*\indexname{Index}
  %% September 08, 2015: Changed \glossaryname to \acronymname
  %% October 01, 2015: "Abbreviations" instead
  \renewcommand*\acronymname{List of Symbols and Abbreviations}
}

%% April 30, 2016: Bold captions
\captionnamefont{\bfseries}
\captiontitlefont{\bfseries}