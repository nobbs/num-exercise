\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{num_exercise}[2017/03/07 Exercise Sheet with JGU styling]

% Load scrartcl class as base document class
\LoadClass[
  11pt,
  a4paper,
  oneside,
  cleardoublepage=plain,
  parskip
]{scrartcl}

% Load important packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{etoolbox}

% exam toggle
\newtoggle{exam}
\togglefalse{exam}

% Declare options
\DeclareOption{exam}{\toggletrue{exam}}
\ProcessOptions\relax

% load even more packages
% typography
\RequirePackage{microtype}

% math and graphics
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage[dvinames]{xcolor}
\RequirePackage{graphicx}

% auxilliary stuff
\iftoggle{exam}{
  \RequirePackage{lastpage}
}{}
 
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{enumitem}
% change itemize / enumerate spacing
\setlist[1]{
  itemsep=1pt,
  topsep=-1ex,
  partopsep=1ex,
  parsep=1ex,
  leftmargin=*
}
\setlist[2]{
  itemsep=1pt,
  topsep=0pt,
  partopsep=1ex,
  parsep=1ex,
}
% change enumerate labels
\setlist[enumerate,1]{
  label=\alph*)
}
\setlist[enumerate,2]{
  label=\itshape\roman*.
}

% exsheets related stuff
\RequirePackage{exsheets}
\DeclareInstance{exsheets-heading}{block-wp-2}{default}{
  join = {
    title[r,B]number[l,B](.333em,0pt) ;
    title[r,B]subtitle[l,B](1em,0pt)
  },
  attach = { 
    main[l,vc]title[l,vc](0pt,0pt) ;
    main[r,vc]points[r,vc](0pt,0pt)
  },
}
\SetupExSheets{
  headings=block-wp-2,
  question/post-body-hook = \par\vspace{2em},
  solution/post-body-hook = \par\vspace{2em},
  solution/pre-hook = \vspace{-2em},
}
% use Aufgabe instead of Übung for the german translation
\DeclareTranslation{german}{exsheets-exercise-name}{Aufgabe}
% exam related stuff
\iftoggle{exam}{
  \SetupExSheets{
    question/type=exam,
    question/pre-hook = \cleardoublepage
  }
}{}

% JGU colors
\definecolor{jgu_red}{RGB}{193,0,42}
\definecolor{jgu_lightgray}{RGB}{172,172,172}
\definecolor{jgu_darkgray}{RGB}{99,99,99}

% metadata commands
\newcommand{\@lecture}{}
\newcommand{\lecture}[1]{\renewcommand{\@lecture}{#1}}
\newcommand{\@lecturer}{}
\newcommand{\lecturer}[1]{\renewcommand{\@lecturer}{#1}}
\newcommand{\@term}{}
\newcommand{\term}[1]{\renewcommand{\@term}{#1}}
\newcommand{\@sheettitle}{}
\newcommand{\sheettitle}[1]{\renewcommand{\@sheettitle}{#1}}
\newcommand{\@sheetdate}{}
\newcommand{\sheetdate}[1]{\renewcommand{\@sheetdate}{#1}}
\newcommand{\@university}{}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\@website}{}
\newcommand{\website}[1]{\renewcommand{\@website}{#1}}
\newcommand{\@lastline}{}
\newcommand{\lastline}[1]{\renewcommand{\@lastline}{#1}}

% set page layout
\areaset{16cm}{25.5cm}
\iftoggle{exam}{}{
  \pagestyle{empty}
}

% page head and foot
\AtBeginDocument{%
  \setlength{\unitlength}{1cm}
  \begin{picture}(15.5,3.5)
    \put(-1,1.36){
      \color{jgu_lightgray}\rule{14.25cm}{1pt}
    }
    \put(-0.15,.5){
      \color{jgu_lightgray}\rule{1pt}{2.9cm}
    }
    \put(12.0,0.5){
      \includegraphics[width=6cm]{logo}
    }
    \put(0.2,1.7){
      \begin{minipage}[b]{11cm}
        \sffamily\bfseries\color{jgu_darkgray}\large 
        \@lecture
        \newline
        \@term
      \end{minipage}
    }
    \put(0.2, 0.75){
      \begin{minipage}[b]{15.6cm}
        \sffamily
        \bfseries
        \large 
        \@sheettitle
        \hfill
        \@sheetdate
      \end{minipage}
    }
  \end{picture}
  \par\vspace{-1em}
}

% only add the footer if it's not an exam
\iftoggle{exam}{}{
  \AtEndDocument{%
    \setlength{\unitlength}{1cm}
    \vspace{\fill}%
    \begin{center}
      \bfseries
      \@lastline%
    \end{center}
    \vspace{-1cm}%
    \begin{picture}(15.5,2)
      \put(-1,0){
        \color{jgu_lightgray}\rule{17cm}{1pt}
      }
      \put(-0.15,-1){
        \color{jgu_lightgray}\rule{1pt}{2cm}
      }
      \put(0.2,0.34){
        \begin{minipage}[b]{15cm}
          \sffamily\color{jgu_darkgray}
          \@lecturer
        \end{minipage}
      }
      \put(0.2,-1){
        \begin{minipage}[b]{15.2cm}
          \color{jgu_darkgray}
            {\sffamily\fontseries{sbc}\selectfont\@university}
            \newline
            {\ttfamily\fontseries{m}\selectfont\url{\@website}}
        \end{minipage}
      }
    \end{picture}
  }
}

\newcommand{\additionaldoublepage}{\newpage$\;$\clearpage}

%% Math operators and other related stuff
% absolute value, norm, ceil, floor
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\norm}{\lVert}{\rVert}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}

% restriction of a map
\newcommand\restr[2]{\ensuremath{\left.#1\right|_{#2}}}

% "set" command, e.g. \Set{ x \in X \given x = 1 }
\providecommand\given{}
\newcommand\SetSymbol[1][]{
   \nonscript\,#1\vert\nonscript\,\mathopen{}\allowbreak}
\DeclarePairedDelimiterX\Set[1]{\lbrace}{\rbrace}{ \renewcommand\given{\SetSymbol[\delimsize]} #1 }

% fat vectors and matrices
\renewcommand{\vec}[1]{\mathbf{#1}}
\newcommand{\mat}[1]{\mathbf{#1}}

% "correct" differential d in integral
\newcommand*\dd{\mathop{}\!\mathrm{d}}
\newcommand*\Dd[1]{\mathop{}\!\mathrm{d^#1}}

% some more operators
\DeclareMathOperator*{\esssup}{ess\,sup}
\DeclareMathOperator*{\argsup}{arg\,sup}
\DeclareMathOperator*{\argmax}{arg\,max}
\newcommand\placeholder{{\mkern2mu\cdot\mkern2mu}}
\newcommand\infsup[2]{\adjustlimits\inf_{#1}\sup_{#2}}
\newcommand\supsup[2]{\adjustlimits\sup_{#1}\sup_{#2}}