\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{KDHnotes}

\DeclareOption{Dynamics}{
	%Dynamics mastery goals
	\newcommand{\posvec}{B}
	\newcommand{\secposvec}{\section*{\posvec. Position Vector}}
	\newcommand{\geom}{A.1}
	\newcommand{\secgeom}{\section*{\geom. Problem Setup and Geometry}}
	\newcommand{\velocityandacceleration}{C}
	\newcommand{\secvelocityandacceleration}{\section*{\velocityandacceleration. Velocity and Acceleration}}
	\newcommand{\FBD}{D}
	\newcommand{\secFBD}{\section*{\FBD. Free Body Diagram}}
	\newcommand{\linearmomentum}{E.1}
	\newcommand{\seclinearmomentum}{\section*{\linearmomentum. Balance of Linear Momentum}}
}

\ProcessOptions

% This class builds on the article class
\LoadClass[landscape,twocolumn,12pt]{article}

\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage{caption}
\RequirePackage{tikz}
\RequirePackage{tcolorbox}
\RequirePackage[toc,page]{appendix}
\RequirePackage{listings}
\RequirePackage[nottoc,numbib]{tocbibind}

% Provides basic commands for section headers
% See: https://ctan.org/pkg/sectsty?lang=en
\RequirePackage{sectsty}
% Two column layout
% These commands will adjust the two column layout to look a bit better
% see: http://scholardox.com/pubs/Landscape.pdf
% Link broken :/
% The original article was:
% Advocating two-column landscape format for scholarly online articles
% By James D. Wells.
% CERN Theoretical Physics
% June 2,2013
%\setlength{\textheight}{17cm}
%\setlength{\textwidth}{24cm}
%\setlength{\lmargin}{2cm}
%\setlength{\rmargin}{2cm}
%\setlength{\topmargin}{-1.5cm} % -2.2cm
%\setlength{\oddsidemargin}{0.0cm}
%\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\parskip}{0cm}
\setlength{\columnsep}{1cm}
\sectionfont{\normalsize}
\subsectionfont{\normalsize}

% Margin specifications:
% https://tex.stackexchange.com/questions/115908/geometry-showframe-landscape
\RequirePackage[
  outer=0.75in,
  inner=0.75in,
  vmargin=0.25in,
  includehead,
  includefoot,
  headheight=15pt
]{geometry}

% Fancy Header Commands
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\setlength{\headheight}{20pt}%15.2
\fancyhf{}
\lhead{\leftmark}
\rhead{\@coursenum---\@coursetitle}
\lfoot{\small\textit{\@author}}
\cfoot{\thepage}

% Make links clickable
\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=blue
}

% Reduce figure padding
\setlength{\intextsep}{1.0 pt plus 2.0pt minus 2.0pt}
\setlength{\belowcaptionskip}{-20pt}

% Stop indenting, add paragraph spacing
% between new paragraphs
\setlength\parindent{0pt}
\setlength{\parskip}{\baselineskip}

% This provides the "strip" command which allows an equation to be one column.
% Note figures and tables can span both columns by adding a "*"
%\RequirePackage{cuted}

% Dont indent new paragraphs
% Add extra space between them.
\setlength\parindent{0pt}
\setlength{\parskip}{\baselineskip}

% Give space for captions
\captionsetup{belowskip=12pt, aboveskip=4pt}

% Define needed new commands for title page
\newcommand*{\coursenum}[1]{\gdef\@coursenum{#1}}
\newcommand*{\@coursenum}{\texttt{\string\coursenum} currently not set. Please define this.}

\newcommand*{\coursetitle}[1]{\gdef\@coursetitle{#1}}
\newcommand*{\@coursetitle}{\texttt{\string\coursetitle} currently not set. Please define this.}

\newcommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand*{\@subtitle}{\texttt{\string\subtitle} currently not set. Please define this.}

\newcommand*{\titleimage}[1]{\gdef\@titleimage{#1}}
\newcommand*{\@titleimage}{example-image-a}
%\newcommand*{\@titleimage}{example-image-c} %if image not set

\newcommand*{\university}[1]{\gdef\@university{#1}}
\newcommand*{\@university}{\texttt{\string\university} currently not set. Please define this.}

\renewcommand*{\maketitle}{%

\begin{titlepage}

\begin{multicols}{2}

\centering

\vspace{0.1cm}

{\textit{\@coursenum}---\textit{\@coursetitle}\unskip\strut\par}
\vspace{0.1cm}
{\Large\bfseries\@title\unskip\strut\par}
\vspace{0.1cm}
{\large\textit{\@subtitle}\unskip\strut\par}

\vfill
\begin{center}
	\includegraphics[width = 0.9\columnwidth]{\@titleimage}
\end{center}
\vfill

{\scshape\LARGE \@university \par}
\vspace{0.1cm}
{\Large\itshape\@author\unskip\strut\par}
\vspace{0.1cm}
{\large Updated: \@date\par}

\columnbreak

\vfill
\begin{tcolorbox}[
	height=0.9\textheight,
	width=\columnwidth,
	colframe=lightgray,
	colback=lightgray,
	halign=left,
	arc=10pt]

	\tableofcontents

\end{tcolorbox}
\vfill

\end{multicols}

\end{titlepage}

}

\definecolor{mattegreen}{rgb}{0.84,0.89,0.74}

% MS-PPT-WORD COLORS:
\definecolor{msblue}{HTML}{DBE5F1}
\definecolor{msorange}{HTML}{FCE9D9}
\definecolor{mspurple}{HTML}{E6E0EC}
\definecolor{msgreen}{HTML}{EBF0DD}
\definecolor{msred}{HTML}{F2DBDB}

% -----
% SYNTAX HIGHLIGHTING
% -----

\RequirePackage[utf8]{inputenc}
\RequirePackage{listings}
\tcbuselibrary{listings}

% Custom colors
\RequirePackage{color}
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}

% Python environment
\newtcblisting{python}
{   colframe=msgreen,
    colback=msgreen,
    listing only,
    listing options={
        language=Python,
        framerule=0.05pt,
        basicstyle=\ttm,
        otherkeywords={self},             % Add keywords here
        keywordstyle=\ttb\color{deepblue},
        emph={MyClass,__init__},          % Custom highlighting
        emphstyle=\ttb\color{deepred},    % Custom highlighting style
        stringstyle=\color{deepgreen},
        breaklines = true
    }
}

%%%---------
\RequirePackage{empheq}
%\tcbuselibrary{listings}
% Box commands
\newtcbox{\purplebox}[1][]{
	nobeforeafter,
	tcbox raise base,
	colframe=blue!30,
	colback=blue!30,
	boxrule=1pt,
}

% purple box shortcut
\newcommand{\pbox}[1]{
	\begin{empheq}[
		box=\purplebox]{align}
		#1
	\end{empheq}
}

\newtcbox{\greenbox}[1][]{
	nobeforeafter,
	tcbox raise base,
	colframe=mattegreen,
	colback=mattegreen,
	boxrule=1pt,
}

% purple box shortcut
\newcommand{\gbox}[1]{
	\begin{empheq}[
		box=\greenbox]{align}
		#1
	\end{empheq}
}

\newtcbox{\bluebox}[1][]{
	nobeforeafter,
	tcbox raise base,
	colframe=msblue,
	colback=msblue,
	boxrule=1pt,
}

% purple box shortcut
\newcommand{\bbox}[1]{
	\begin{empheq}[
		box=\bluebox]{align}
		#1
	\end{empheq}
}


%%%%%%%
% The following makes () automatically \left and \right!
\makeatletter
\def\resetMathstrut@{%
  \setbox\z@\hbox{%
    \mathchardef\@tempa\mathcode`\[\relax
    \def\@tempb##1"##2##3{\the\textfont"##3\char"}%
    \expandafter\@tempb\meaning\@tempa \relax
  }%
  \ht\Mathstrutbox@\ht\z@ \dp\Mathstrutbox@\dp\z@}
\makeatother
\begingroup
  \catcode`(\active \xdef({\left\string(}
  \catcode`)\active \xdef){\right\string)}
\endgroup
\mathcode`(="8000 \mathcode`)="8000
\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}


%% FIGURE COMMAND
\RequirePackage{float}
\RequirePackage[export]{adjustbox} % loads also graphicx

\newcommand{\fig}[2]{
%1: Path relative to Figures/
%2: Caption
	\begin{figure}[h]
		\centering
		\includegraphics[max height=0.4\textheight,max width=0.8\textwidth]{Figures/#1}
		\caption{#2}
		\label{Fig:#1}
	\end{figure}
}

%% FIGURE for .ipynb file conversion
\RequirePackage{float}
\newcommand{\ipynbfig}[2]{
%1: Path relative to Figures/
%2: Caption
	\begin{figure}[h]
		\centering
		\includegraphics[max height=0.4\textheight,max width=0.8\textwidth]{#1}
		\caption{#2}
		\label{Fig:#1}
	\end{figure}
}

\renewcommand{\vec}[1]{\boldsymbol{\mathbf{#1}}}

\endinput