%________________________________________________________________________
%    File : SYSC4907-Report.cls    (LaTeX2e class file)
%  Author : Jason Jaskolka
% Version : 1.0

% This file contains a class definition, SYSC 4907 Report, for the LaTeX2e
% system which defines the layout of SYSC 4907 Project Reports.
%________________________________________________________________________

\NeedsTeXFormat{LaTeX2e}[2018/09/15]
\ProvidesClass{SYSC4907-Report}[2018/09/15 v1.0 SYSC4907 Report Class]


% Required Packages
%------------------------------------------------------------------------------
\RequirePackage{ifthen} 
%------------------------------------------------------------------------------

% Class Options
%------------------------------------------------------------------------------
\newcommand{\pntsize}{}       % the default font size

\newcommand{\optionerror}[1]
   {\typeout{*** Warning: #1 is not a legal class option}}

\DeclareOption{12pt}{\renewcommand{\pntsize}{12pt}}
\DeclareOption{11pt}{\renewcommand{\pntsize}{11pt}}
\DeclareOption{10pt}{\renewcommand{\pntsize}{}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt}   % the default options
\ProcessOptions
\LoadClass[\pntsize]{report}
%------------------------------------------------------------------------------

% Required Packages
%------------------------------------------------------------------------------
\RequirePackage{amsmath} 
\RequirePackage{amssymb} 
\RequirePackage{amstext}
\RequirePackage{amsthm} 
\RequirePackage{datetime}
\RequirePackage{enumerate}
\RequirePackage{fontenc}
\RequirePackage{graphicx} 
\RequirePackage{hyperref}
\RequirePackage{ifthen} 
\RequirePackage{xspace}
\usepackage{setspace}
\usepackage{float}
\usepackage{comment}
%------------------------------------------------------------------------------

% Additional Macros
%------------------------------------------------------------------------------
\newcommand{\eg}{\textrm{e.g.,}\@\xspace}
\newcommand{\ie}{\textrm{i.e.,}\@\xspace}
\newcommand{\etc}{\textrm{etc.}\@\xspace}
%------------------------------------------------------------------------------

% Special Environments
%------------------------------------------------------------------------------
\theoremstyle{plain}
\newtheorem*{maintheorem}{Theorem}
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{corollary}[theorem]{Corollary}

\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{remark}[theorem]{Remark}

\theoremstyle{remark}
\newtheorem{example}[theorem]{Example}
\newtheorem*{notation}{Notation}
%------------------------------------------------------------------------------

% Pagination Format & Settings
%------------------------------------------------------------------------------
\onehalfspacing
\makeatletter
\oddsidemargin 0.5in \evensidemargin 0.5in
\marginparwidth 40pt \marginparsep 10pt
\topmargin 0pt \headsep .5in
\textheight 8.1in \textwidth 6in
\brokenpenalty=10000
\renewcommand{\baselinestretch}{1.3}

%\renewcommand{\floatpagefraction}{0.1} %default: 0.6

\newdateformat{monthyeardate}{\monthname[\THEMONTH] \THEYEAR}
%------------------------------------------------------------------------------

% University Information
%------------------------------------------------------------------------------
\newcommand{\University}{Carleton University}
\newcommand{\Faculty}{Faculty of Engineering and Design}
\newcommand{\Department}{Department of Systems and Computer Engineering}

% Department Address
\newcommand{\Address}{1125 Colonel By Drive}
\newcommand{\City}{Ottawa}
\newcommand{\Province}{ON}
\newcommand{\Country}{Canada}
\newcommand{\PostalCode}{K1S 5B6}
%------------------------------------------------------------------------------

% Titles, Authorship, and Project Macros
%------------------------------------------------------------------------------
\newcommand{\ProjectTitle}[1]{\newcommand{\@ProjectTitle}{#1}}
\let\@ProjectTitle\relax
\newcommand{\DocTitle}[1]{\newcommand{\@DocTitle}{#1}}
\let\@DocTitle\relax

\newcommand{\AuthorA}[1]{\newcommand{\@AuthorA}{#1}}
\let\@AuthorA\relax
\newcommand{\AuthorB}[1]{\newcommand{\@AuthorB}{#1}}
\let\@AuthorB\relax
\newcommand{\AuthorC}[1]{\newcommand{\@AuthorC}{#1}}
\let\@AuthorC\relax
\newcommand{\AuthorD}[1]{\newcommand{\@AuthorD}{#1}}
\let\@AuthorD\relax
\newcommand{\AuthorE}[1]{\newcommand{\@AuthorE}{#1}}
\let\@AuthorE\relax

\newcommand{\Supervisor}[1]{\newcommand{\@Supervisor}{#1}}
\let\@Supervisor\relax

%------------------------------------------------------------------------------

% Section and Chapter Headings Format
%------------------------------------------------------------------------------
\def\cl@chapter{\@elt{section}\@elt{footnote}}
\def\thefigure{\@arabic\c@figure}
\def\thetable{\@arabic\c@table}
\def\theequation{\arabic{equation}}


%------------------------------------------------------------------------------

% Float Settings
%------------------------------------------------------------------------------
\def\@xfloat#1[#2]{\ifhmode \@bsphack\@floatpenalty -\@Mii\else
   \@floatpenalty-\@Miii\fi\def\@captype{#1}\ifinner
      \@parmoderr\@floatpenalty\z@
    \else\@next\@currbox\@freelist{\@tempcnta\csname ftype@#1\endcsname
       \multiply\@tempcnta\@xxxii\advance\@tempcnta\sixt@@n
       \@tfor \@tempa :=#2\do
                        {\if\@tempa h\advance\@tempcnta \@ne\fi
                         \if\@tempa t\advance\@tempcnta \tw@\fi
                         \if\@tempa b\advance\@tempcnta 4\relax\fi
                         \if\@tempa p\advance\@tempcnta 8\relax\fi
         }\global\count\@currbox\@tempcnta}\@fltovf\fi
    \global\setbox\@currbox\vbox\bgroup 
    \def\baselinestretch{1}\@normalsize
    \boxmaxdepth\z@
    \hsize\columnwidth \@parboxrestore}
\long\def\@footnotetext#1{\insert\footins{\def\baselinestretch{1}\footnotesize
    \interlinepenalty\interfootnotelinepenalty 
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}}}
%------------------------------------------------------------------------------

% Title Page
%------------------------------------------------------------------------------
\newif\ifcopyright \newif\iffigurespage \newif\iftablespage
\copyrighttrue \figurespagetrue \tablespagetrue

\def\titlepage{%
	\thispagestyle{empty}%
	\null\vskip1in%
	\begin{center}
		{\Large\uppercase\expandafter{\@ProjectTitle}}
	\end{center}
	\vfill
	\begin{center}
		\rm By\\
        \@AuthorA%
	    \ifthenelse{\equal{\@AuthorB}{}}{}{\\\@AuthorB}%
	    \ifthenelse{\equal{\@AuthorC}{}}{}{\\\@AuthorC}%
	    \ifthenelse{\equal{\@AuthorD}{}}{}{\\\@AuthorD}%
	    \ifthenelse{\equal{\@AuthorE}{}}{}{\\\@AuthorE}%
	\end{center}\vfill
	\begin{center}
		\rm Supervisor: \@Supervisor\\
	\end{center}\vfill
	\begin{center}
		A report submitted in partial fulfillment of the requirements\\
		of SYSC 4907 Engineering Project
	\end{center}
	\vfill
	\begin{center}
		\Department\\\Faculty\\\University
		\vfill 
		Copyright \copyright\ \monthyeardate\today
	\end{center}
        \newpage}

\def\copyrightpage{%
	\null\vfill
	\begin{center}
		\Large\copyright\ Copyright \@copyrightyear\\
		\rm By\\
        \@AuthorA%
	    \ifthenelse{\equal{\@AuthorB}{}}{}{\\\@AuthorB}%
	    \ifthenelse{\equal{\@AuthorC}{}}{}{\\\@AuthorC}%
	    \ifthenelse{\equal{\@AuthorD}{}}{}{\\\@AuthorD}%
	    \ifthenelse{\equal{\@AuthorE}{}}{}{\\\@AuthorE}%
	\end{center}
	\vfill\newpage}
%------------------------------------------------------------------------------

% Preface Code
%------------------------------------------------------------------------------
\def\beforepreface{
	\pagenumbering{roman}
	\pagestyle{plain}
	\titlepage
	}

\def\prefacesection#1{%
	\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}}

\def\prefaceTOC{\newpage
	\tableofcontents}
	
\def\prefaceLOF{
	\iffigurespage
		\newpage
		{\addvspace{10pt}
		\let\saveaddvspace=\addvspace
		\def\addvspace##1{}
		\listoffigures
		\let\addvspace=\saveaddvspace}
		\newpage
	\fi}
	
\def\prefaceLOT{
	\iftablespage
	    \newpage
		{\addvspace{10pt}
		\let\saveaddvspace=\addvspace
		\def\addvspace##1{}
		\listoftables
		\let\addvspace=\saveaddvspace}
	\fi}
	

\def\endpreface{\newpage
	\pagenumbering{arabic}
	\pagestyle{headings}}

% Start with pagestyle{headings} in case front matter isn't processed
\pagestyle{headings}
\makeatother
%------------------------------------------------------------------------------