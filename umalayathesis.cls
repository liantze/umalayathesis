%%
%% umalayathesis.cls 2012/09/20 version V1.02
%%
%% This is the unofficial UM thesis LaTeX class for postgraduate research
%% students of Universiti Malaya, Malaysia, formatted
%% according to the Guide to the Preparation, Submission and Examination
%% of Theses, published by IPS UM.
%% 
%% The latest version and documentation of umalayathesis can be obtained at
%% http://liantze.penguinattack.org/latextypesetting.html#umalayathesis.
%% Contact liantze AT gmail DOT com if you have any questions or
%% assistance or feedback.  Apologies if I can't respond immediately, but
%% I'll always try.
%%
%%
%% Copyright (c) 2011-2012 by Lim Lian Tze
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

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{umalayathesis}

\LoadClass[12pt,a4paper,oneside]{memoir}
\RequirePackage{textcomp}
\RequirePackage{etoolbox}
\RequirePackage{paralist}
\RequirePackage[english]{babel}

\def\theauthor{\textbf{!INSERT AUTHOR!}}
\def\thetitle{\textbf{!INSERT TITLE!}}
\def\@mtsubmissionyear{\textbf{!INSERT YEAR!}}
\def\@mtdegree{\textbf{!INSERT DEGREE!}}

\newcommand{\submissionyear}[1]{\def\@mtsubmissionyear{#1}}
\newcommand{\degree}[1]{\def\@mtdegree{#1}}


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
\setulmarginsandblock{20mm}{20mm}{*}
\setheadfoot{\baselineskip}{10mm}
\addtolength\footskip{-6pt}
\makeoddfoot{plain}{}{}{\thepage}
\makeevenfoot{plain}{}{}{\thepage}
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
\RequirePackage{mathptmx}
%\RequirePackage{courier}
\renewcommand\ttdefault{lmvtt}

\RequirePackage[breaklinks,pdfborder={0 0 0}]{hyperref}

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
\newcommand{\makecoverandtitlepage}{%
\ignorespaces
\changepage{-40mm}{-15mm}{15mm}{0em}{0em}{20mm}{0em}{0em}{0em}
\begin{titlingpage}
\SingleSpacing%
\centering%
\renewcommand\ttdefault{lmtt}%
\fontfamily{phv}\fontseries{mc}\fontsize{15pt}{17pt}\selectfont%
\MakeUppercase{\thetitle}\par%
\vfill%
\MakeUppercase{\theauthor}\par%
\vfill%
INSTITUTE OF POSTGRADUATE STUDIES\\%
UNIVERSITY OF MALAYA\\%
KUALA LUMPUR\par%
\bigskip%
\@mtsubmissionyear\par%
\end{titlingpage}%
{\SingleSpacing\centering\thispagestyle{empty}\setcounter{page}{1}%
\fontsize{15pt}{17pt}\selectfont%
\renewcommand\ttdefault{lmtt}%
\MakeUppercase{\thetitle}\par%
\vfill%
{\MakeUppercase{\theauthor}\par}%
\vfill%
{THESIS SUBMITTED IN FULFILMENT\\%
OF THE REQUIREMENTS\\%
FOR THE DEGREE OF \MakeUppercase{\@mtdegree}\par}%
\vfill%
{INSTITUTE OF POSTGRADUATE STUDIES\\%
UNIVERSITY OF MALAYA\\%
KUALA LUMPUR}\\[1em]%
\@mtsubmissionyear%\\[3em]%
\par\clearpage}%
\changepage{40mm}{15mm}{-15mm}{0em}{0em}{-20mm}{0em}{0em}{0em}%
\renewcommand\ttdefault{lmvtt}%
}



%%%%%%%%%%%%
% The Declaration page
%%%%%%%%%%%%
\newcommand{\declarationpage}{%
\chapter[Original Literary Work Declaration]{{\large Universiti Malaya}\vskip1em Original Literary Work Declaration}

\noindent Name of Candidate: \hfill (I.C./Passport No.:\hspace{10em})\par
\noindent Registration/Matrix No.:\par
\noindent Name of Degree:\par
\noindent Title of Project Paper/Research Report/Dissertation/Thesis (``this Work''):\vskip 3em\par
\noindent Field of Study:\par

{\SingleSpacing
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

{\SingleSpacing\noindent{\small Name:}\par
\noindent{\small Designation:}\par}
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
\cftaddtitleline{toc}{chapter}{DEDICATION}{\thepage}%
\begin{vplace}[.5]\centering#1\end{vplace}%
\clearpage}


%%%%%%%%%%%%
% The Abstract
%%%%%%%%%%%%
\abstractintoc
\renewcommand*\abstractname{\texorpdfstring{ABSTRACT}{Abstract}}
\renewcommand*\absnamepos{center}
\setlength\abstitleskip{0pt}
\renewcommand\abstractnamefont{\normalsize\bfseries}
\renewcommand\abstracttextfont{\normalsize}
\setlength\absleftindent{0pt}
\setlength\absrightindent{0pt}
\newcommand{\abstractfromfile}[1]{\begin{abstract}\input{#1}\end{abstract}}

%%%%%%%%%%%%
% The Preface
%%%%%%%%%%%%
\newenvironment{preface}{\chapter{Preface}}{}
\newcommand{\prefacefromfile}[1]{\begin{preface}\input{#1}\end{preface}}

%%%%%%%%%%%%
% Chapter headings
%%%%%%%%%%%%
\renewcommand\chapterheadstart{\normalsize\vskip\beforechapskip}
\setlength\beforechapskip{0pt}
\setlength\midchapskip{2\onelineskip}
\setlength\afterchapskip{2\onelineskip}
\renewcommand*\chapnamefont{\normalsize\bfseries}
\renewcommand*\chapnumfont{\normalsize\bfseries\centering}
\renewcommand*\chaptitlefont{\SingleSpacing\normalsize\bfseries\centering}
\renewcommand{\printchaptername}{{\chapnamefont\MakeUppercase{\chaptername}}}
\renewcommand*{\afterchapternum}{\vskip\midchapskip}
\renewcommand*{\printchaptertitle}[1]{{\chaptitlefont\MakeUppercase{#1}\par}}


%%%%%%%%%%%%
% The Appendices
%%%%%%%%%%%%
\renewcommand*\appendixname{Appendix}
\renewcommand\appendixtocname{\texorpdfstring{APPENDICES}{Appendices}}
\newlistof{listofappendices}{apx}{\texorpdfstring{LIST OF APPENDICES}{List of Appendices}} 
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
  \cftinserthook{apx}{AppendixToCLines}
  \appendix\appendixpage%
  \let\@chapter\app@chapter % use \app@chapter instead of \@chapter 
  \renewcommand\mychap[1]{\orichapter{##1}}
  \settocdepth{chapter}% stop sections being in the ToC 
  \renewcommand{\insertchapterspace}{\oldinsertchapterspace}
} 
\newcommand*{\finishapps}{% 
  \renewcommand\mychap[1]{\orichapter[\texorpdfstring{\MakeUppercase{##1}}{##1}]{##1}}
  \settocdepth{section}% sections back in ToC 
} 
\cftinsertcode{AppendixToCLines}{%
\renewcommand*\cftchapteraftersnum{}%
\setlength\cftchapternumwidth{2em}%
\renewcommand*\cftchapterfont{\normalfont\mdseries\upshape}%
\renewcommand*\cftchapterpagefont{\normalfont\mdseries\upshape}%
}

%%%%%%%%%%%%
% Sectional headings
%%%%%%%%%%%%
\setsecnumdepth{subsubsection}
\setsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesecskip{2.5ex plus 1ex minus .2ex}
\setaftersecskip{0.1ex plus .2ex}
\setsubsecheadstyle{\SingleSpacing\normalsize\bfseries}
\setbeforesubsecskip{2.5ex plus 1ex minus .2ex}
\setaftersubsecskip{0.1ex plus .2ex}
\renewcommand\thesubsubsection{\thesubsection\space(\alph{subsubsection})}
\setsubsubsecheadstyle{\SingleSpacing\normalsize\itshape}
\setbeforesubsubsecskip{2.5ex plus .2ex minus .2ex}
\setaftersubsubsecskip{0.1ex plus .2ex}


%%%%%%%%%%%
% ToC etc
%%%%%%%%%%%
\settocdepth{subsection}
\renewcommand\cftdotsep{\cftnodots}
\setrmarg{3.55em plus 1fil}
\renewcommand*{\cftchaptername}{\MakeUppercase{\chaptername}\space}
\renewcommand*{\cftchapteraftersnum}{:\space}
\renewcommand*{\cftchapterafterpnum}{\vspace*{4pt}}
\renewcommand*{\cftappendixname}{\appendixname\space}
\setlength\cftsectionindent{0pt}
\let\orichapter\chapter
\renewcommand\chapter{\@ifstar{\mystarchap}{\mychap}}
%\newcommand\mychap[2][]{\orichapter[\texorpdfstring{\MakeUppercase{#1}}{#1}]{#2}}
\newcommand\mychap[2][]{\orichapter%
[\ifstrempty{#1}{\texorpdfstring{\MakeUppercase{#2}}{#2}}%
{\texorpdfstring{\MakeUppercase{#1}}{#1}}]%
{#2}}
\newcommand\mystarchap[1]{\orichapter*{#1}}
\renewcommand*\cftsectionafterpnum{\vskip 3pt}
\setlength\cftsubsectionindent{\cftsectionnumwidth}
\renewcommand*\cftfigurename{\figurename\space}
\renewcommand*\cfttablename{\tablename\space}
\renewcommand*\cftfigureafterpnum{\vskip 3pt}
\renewcommand*\cfttableafterpnum{\vskip 3pt}

\let\oldinsertchapterspace\insertchapterspace
\addtodef{\insertchapterspace}{}%
{\addtocontents{toc}{\protect\vspace*{-4pt}}}

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
\renewcommand\bibliographytypesize{\footnotesize}
%\setlength\bibitemsep{\onelineskip}
\setlength\bibleftmargin{2em}
\setlength\bibindent{-2em}

\patchcommand{\bibitem}{\SingleSpacing}{}
\AtBeginDocument{\renewcommand*\bibname{\texorpdfstring{REFERENCES}{References}}}

%\RequirePackage{multibib}
%\newcites{own}{Publication List}
%\bibliographystyleown{apacite}
%\addtoiargdef{\bibliographyown}{}{\renewcommand*\refname{\texorpdfstring{PUBLICATION LIST}{Publication List}}}

\RequirePackage{relsize}
\RequirePackage[toc,nonumberlist,shortcuts,translate=false,style=long]{glossaries}
\RequirePackage{glossaries-babel}
%\renewcommand*{\acrnameformat}[2]{#2 (\acronymfont{#1})}
\renewcommand*{\glsgroupskip}{}
\renewcommand{\glossarypreamble}{\footnotesize}
\renewcommand{\glossarypostamble}{\normalsize}
\makeglossaries
\newcommand\listacrname{List of Symbols and Acronyms}
\newcommand\listofacronyms{{\renewcommand*{\arraystretch}{1.2}\printglossary[type=\acronymtype]}}
\addto\captionsenglish{%
\renewcommand*\abstractname{\texorpdfstring{ABSTRACT}{Abstract}}
\renewcommand*\contentsname{\texorpdfstring{TABLE OF CONTENTS}{Table of Contents}}
\renewcommand*\listtablename{\texorpdfstring{LIST OF TABLES}{List of Tables}}
\renewcommand*\listfigurename{\texorpdfstring{LIST OF FIGURES}{List of Figures}}
\renewcommand*\indexname{\texorpdfstring{INDEX}{Index}}
\renewcommand*\glossaryname{\texorpdfstring{LIST OF SYMBOLS AND ACRONYMS}{List of Symbols and Acronyms}}
}

