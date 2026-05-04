\ProvidesClass{IAUthesis}[2026/05/01 v1.0 Documentclass for a thesis at the IAU]

% set if flags
\newif\ifgerman
\newif\ifenglish
\newif\ifabstract
\newif\ifacknowledge
\newif\ifdeclaration
\newif\iftcontents
\newif\iftfigures
\newif\ifttables
\newif\iftodonotes
\newif\iftwoside
\newif\ifoneside
\newif\ifamspacks
\newif\iflargemargins
\newif\iffancypagenumbers

% set defaults
\germanfalse
\englishtrue
\abstracttrue
\acknowledgetrue
\declarationtrue
\tcontentstrue
\tfigurestrue
\ttablestrue
\todonotesfalse
\twosidetrue
\onesidefalse
\amspackstrue
\largemarginsfalse
\fancypagenumbersfalse

% option declaration and processing
\DeclareOption{german}{\germantrue\englishfalse}
\DeclareOption{english}{\englishtrue\germanfalse}
\DeclareOption{noabstract}{\abstractfalse}
\DeclareOption{noacknowledgements}{\acknowledgefalse}
\DeclareOption{nodeclaration}{\declarationfalse}
\DeclareOption{notoc}{\tcontentsfalse}
\DeclareOption{notof}{\tfiguresfalse}
\DeclareOption{notot}{\ttablesfalse}
\DeclareOption{todonotes}{\todonotestrue}
\DeclareOption{oneside}{\onesidetrue\twosidefalse}
\DeclareOption{twoside}{\twosidetrue\onesidefalse}
\DeclareOption{noams}{\amspacksfalse}
\DeclareOption{largemargins}{\largemarginstrue}
\DeclareOption{fancypagenumbers}{\fancypagenumberstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\ifoneside
	\PassOptionsToClass{oneside}{report}
\else
	\PassOptionsToClass{twoside}{report}
\fi
	
\LoadClass[a4paper,titlepage]{report}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{mathptmx} % math font
\RequirePackage{lmodern} % text font
\RequirePackage[
	final,
	tracking=true,
	kerning=true,
	expansion=true,
	protrusion=true,
	spacing=true,
	factor=1050,
	stretch=25,
	shrink=10,
	babel=true
]{microtype} % better typesetting
\RequirePackage{tikz} % draw your own figures
\RequirePackage{graphicx} % better handling of figures
\RequirePackage{xcolor}

\ifgerman
	\RequirePackage[main=ngerman,english]{babel}
\else
	\RequirePackage[main=english, ngerman]{babel}
\fi

\addto\captionsenglish{\renewcommand{\chaptername}{Part}}
\addto\captionsngerman{\renewcommand{\chaptername}{Teil}}
\newcommand{\supervisors}{\iflanguage{ngerman}{Betreuer}{Supervisors}}
\newcommand{\bibtitle}{\iflanguage{ngerman}{Quellen}{References}}
\newcommand{\abbrtitle}{\iflanguage{ngerman}{Abkürzungen}{Abbreviations}}
\newcommand{\abstracttitle}{\iflanguage{ngerman}{Abstract}{Abstract}}
\newcommand{\acknowledgementstitle}{\iflanguage{ngerman}{Danksagung}{Acknowledgements}}
\newcommand{\declarationtitle}{\iflanguage{ngerman}{Erklärung}{Declaration}}
\newcommand{\declarationdefault}{%
\iflanguage{ngerman}{%
\noindent Ich versichere hiermit, dass ich die vorliegende Arbeit selbstständig verfasst und keine anderen als die im Literaturverzeichnis angegebenen Quellen benutzt habe. Ich habe die Regeln der guten wissenschaftlichen Praxis eingehalten.\bigskip

\noindent Alle Stellen, die wörtlich oder sinngemäß aus veröffentlichten oder noch nicht veröffentlichten Quellen entnommen sind, sind als solche kenntlich gemacht.\bigskip

\noindent Die Zeichnungen oder Abbildungen in dieser Arbeit sind von mir selbst erstellt worden oder mit einem entsprechenden Quellennachweis versehen.\bigskip

\noindent Die Nutzung von Künstlicher Intelligenz (KI), spezifisch von ``Large Language Models'' (LLMs), begrenzt sich auf die Verbesserung von Formulierungen.\bigskip

\noindent Diese Arbeit ist in gleicher oder ähnlicher Form noch bei keiner anderen Prüfungsbehörde eingereicht worden.}{%
\noindent I hereby declare that I have written this thesis independently and have not used any sources other than those listed in the bibliography. I have adhered to the rules of good scientific practice.\bigskip

\noindent All passages that are taken verbatim or in substance from published or unpublished sources are identified as such.\bigskip

\noindent The drawings or illustrations in this paper have been created by me or are accompanied by appropriate references.\bigskip

\noindent The use of artificial intelligence (AI), specifically of large language models (LLMs), was limited to the improvement of phrasing.\bigskip

\noindent This thesis has not been submitted in the same or a similar form to any other examination authority.}}
\newcommand{\declarationsignature}{%
\iflanguage{ngerman}{\\[50\p@]

\noindent\begin{minipage}{.4\linewidth}
\hrule\vspace*{5\p@}
Ort, Datum 
\end{minipage}\hfill\begin{minipage}{.4\linewidth}
\hrule\vspace*{5\p@}
Unterschrift
\end{minipage}}{\\[50\p@]

\noindent\begin{minipage}{.4\linewidth}
\hrule\vspace*{5\p@}
Place, Date 
\end{minipage}\hfill\begin{minipage}{.4\linewidth}
\hrule\vspace*{5\p@}
Signature
\end{minipage}}}
\newcommand{\iau}{\iflanguage{ngerman}{Institut für\\Atmosphäre und Umwelt,\\Goethe Universität Frankfurt}{Institute for  Atmospheric and\\Environmental Sciences,\\Goethe University Frankfurt}}

\relax

\RequirePackage[hidelinks, pdfusetitle]{hyperref}
\RequirePackage[belowskip=12pt]{caption}
\RequirePackage[
	backend=biber,
	style=authoryear,%numeric,
	sorting=anyt,%none,
	natbib=true,
	maxbibnames=99,
	maxcitenames=2,
	uniquelist=minyear,
	]{biblatex} % handling of sources
\RequirePackage[
	output-decimal-marker={,},
	range-phrase={ -- },
	range-units=single,
	separate-uncertainty = true,
	exponent-product=\cdot]{siunitx} % Handling of Units
\DeclareSIUnit\unitbar{bar}
\DeclareSIUnit\torr{Torr}
\DeclareSIUnit\unityear{yr}
\ifamspacks
	\RequirePackage{amsmath}
	\RequirePackage{amsthm}
	\RequirePackage{amssymb}
\fi
\RequirePackage[autostyle=true]{csquotes} % better handling of quotes
\MakeOuterQuote{"}         % outer quotes: `` ... ''
\RequirePackage[
	section=chapter,
	numberedsection,
	nopostdot,
	nogroupskip,
	toc,
	ucmark,
	nonumberlist,
	style=alttree]{glossaries-extra} % Handling of abbreviations
%\setabbreviationstyle{long-short}
\makenoidxglossaries
\setabbreviationstyle[abbreviation]{long-short}
\renewcommand{\glsglossarymark}[1]{}


\iflargemargins
	\usepackage[
		includeall,
		bindingoffset=1.5cm,
		inner=1.5cm, 
		outer=0cm,%3cm,
		head=1cm,
		headsep=7mm,
		top=2cm,
		foot=2cm, 
		bottom=4cm,
		marginparsep=3mm,%0cm, 
		marginparwidth=27mm,%0cm,
	]{geometry} % 20cm x 15cm
\else
	\iftwoside
		\RequirePackage[
			includeall,
			bindingoffset=1cm,
			inner=1cm, 
			outer=0cm,
			head=1cm,
			headsep=7mm,
			top=1cm,
			foot=2cm, 
			bottom=2cm,
			marginparsep=3mm,%0cm, 
			marginparwidth=27mm,%0cm,
		]{geometry} % 23cm x 16cm Text
	\fi
	\ifoneside
		\RequirePackage[
			includeall,
			bindingoffset=1cm,
			inner=15mm, 
			outer=0cm,
			head=1cm,
			headsep=7mm,
			top=1cm,
			foot=2cm, 
			bottom=2cm,
			marginparsep=3mm,%0cm, 
			marginparwidth=22mm,%0cm,
		]{geometry} % 23cm x 16cm Text
	\fi
\fi
	
\iftodonotes
	\RequirePackage[colorinlistoftodos]{todonotes}
\else
	\RequirePackage[colorinlistoftodos, disable]{todonotes}
\fi	
\RequirePackage{setspace} % \singlespacing, \onehalfspacing, and \doublespacing, \begin{spacing}{1.5}
\flushbottom
\relax


\RequirePackage{fancyhdr}
\iftwoside
	\fancypagestyle{main}{
		\fancyhf{}
		\fancyhead[LE]{\textbf{\leftmark}}
		\fancyhead[RO]{\rightmark}
		\fancyfoot[LE,RO]{\thepage}
		\renewcommand{\headrulewidth}{1pt}}
	\fancypagestyle{frontmatter}{
		\fancyhf{}
		\fancyhead[LE,RO]{\textbf{\leftmark}}
		\fancyfoot[LE,RO]{\thepage}
		\renewcommand{\headrulewidth}{1pt}}
	\fancypagestyle{appendix}{
		\fancyhf{}
		\fancyhead[LE,RO]{\textbf{\leftmark}}
		\fancyfoot[LE,RO]{\thepage}
		\renewcommand{\headrulewidth}{1pt}}
	\fancypagestyle{plain}{%
		\fancyhf{}
		\fancyfoot[LE,RO]{\thepage}
		\renewcommand{\headrulewidth}{0pt}}
\fi
\ifoneside
	\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
	\fancypagestyle{main}{%
		\fancyhf{}%
		\fancyhead[L]{\textbf{\@chapapp~\thechapter}}%
		\fancyhead[R]{\leftmark}%
		\fancyfoot[C]{\thepage}%
		\renewcommand{\headrulewidth}{1pt}}
	\fancypagestyle{frontmatter}{%
		\fancyhf{}%\fancyhead[L]{}%
		\fancyhead[R]{\leftmark}%
		\fancyfoot[C]{\thepage}%
		\renewcommand{\headrulewidth}{1pt}}
	\fancypagestyle{appendix}{%
		\fancyhf{}%
		\fancyhead[L]{\textbf{\@chapapp~\thechapter}}%
		\fancyhead[R]{\leftmark}%
		\fancyfoot[C]{\thepage}%
		\renewcommand{\headrulewidth}{1pt}}
	\fancypagestyle{plain}{%
		\fancyhf{}%
		\fancyfoot[C]{\thepage}%
		\renewcommand{\headrulewidth}{0pt}}
\fi
\relax


% Verändertes Abstract
\renewenvironment{abstract}
 {\list{}{%
    \setlength{\leftmargin}{0mm}%
    \setlength{\rightmargin}{\leftmargin}%
  }%
  \item\relax}
 {\endlist}

\setlength\smallskipamount{8\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{16\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{24\p@ \@plus 4\p@ \@minus 4\p@}

% Kapitel Überschriften
\def\@makechapterhead#1{%
	\cleardoublepage\thispagestyle{plain}
	\vspace*{10\p@}%
	{
		\parindent \z@ \raggedleft \normalfont
		\ifnum \c@secnumdepth >\m@ne
		\Large\bfseries \@chapapp\space \thechapter
		\par\nobreak\vskip 5\p@
		\fi
		\hrule height 1pt
		\par\nobreak\vskip 5\p@
		\interlinepenalty\@M
		\Huge \bfseries #1\par\nobreak~
		\vskip 10\p@
	}}
% Kapitel Überschriften
\def\@makeschapterhead#1{%
	\ifnum\c@chapter=0
		\thispagestyle{frontmatter}%
  	\else%
    		\thispagestyle{appendix}%
  	\fi%
  	\vspace*{0\p@}%
	{
		\parindent \z@ \raggedright \normalfont
		\par\nobreak\vskip 0\p@
		\interlinepenalty\@M
		\Huge \bfseries #1\par\nobreak~
		\vskip 0\p@
	}%
}%

\relax

% Eigenes Titelblatt

\def\@firstreviewer{Name}
\newcommand{\firstreviewer}[1]{
  \def\@firstreviewer{#1}
}

\def\@secondreviewer{Name}
\newcommand{\secondreviewer}[1]{
  \def\@secondreviewer{#1}
}

\def\@abstracttext{This is the text of my abstract.}
\newcommand{\abstracttext}[1]{
  \def\@abstracttext{#1}
}

\def\@acknowledgements{These are my acknowledgements.}
\newcommand{\acknowledgements}[1]{
  \def\@acknowledgements{#1}
}

\def\@declarationtext{\declarationdefault}
\newcommand{\declarationtext}[1]{
  \def\@declarationtext{#1}
}

\def\@affiliation{\iau}
\newcommand{\affiliation}[1]{
  \def\@affiliation{#1}
}

\def\@thesistype{Thesis}
\newcommand{\thesistype}[1]{
  \def\@thesistype{#1}
}

\def\@thesisdegree{~}
\newcommand{\thesisdegree}[1]{
  \def\@thesisdegree{#1}
}

\def\@contact{\textit{\supervisors:}\\{\@firstreviewer}\\{\@secondreviewer}}
\newcommand{\contact}[1]{
  \def\@contact{#1}
}

\renewcommand{\maketitle}{
\begin{titlepage}\pagestyle{empty}\singlespacing\newgeometry{
	includeall,
	bindingoffset=1cm,
	inner=2cm, 
	outer=2.5cm,
	head=1cm,
	headsep=7mm,
	top=2cm,
	foot=2cm, 
	bottom=1cm,
	marginparsep=0cm, 
	marginparwidth=0cm,}
\begin{tikzpicture}[remember picture, overlay, shift=(current page.south west)]
\begin{scope}[x={(current page.south east)},y={(current page.north west)}]
\draw ({19.7/21},{28.4/29.7}) node[anchor=north east] {\includegraphics[width=6cm]{GU-Logo-blau-gross.png}};
\end{scope}
\end{tikzpicture}
\vspace*{8em}
\begin{center}
\textsc{{\Large \@thesistype}\\[.6em]{\@thesisdegree}}\\[6em]
\begin{minipage}{.9\linewidth}
\begin{center}\begin{spacing}{1.6}\hrule\vspace*{1em}\textbf{\LARGE\@title}\vspace*{1em}\hrule\vspace*{6em}{\large\@author}\\[.6em]{\@date}
\end{spacing}\end{center}
\end{minipage}
\end{center}
\vfill
\begin{minipage}[t]{.5\linewidth}
\@contact
\end{minipage}\begin{minipage}[t]{.5\linewidth}\raggedleft
\@affiliation
\end{minipage}
\end{titlepage}\restoregeometry\thispagestyle{empty}\cleardoublepage
\setcounter{page}{1}\setstretch{1.5}\pagestyle{plain}
\iffancypagenumbers
	\pagenumbering{roman}
\fi
\ifdeclaration
	\chapter*{\declarationtitle}\thispagestyle{plain}
	\@declarationtext\declarationsignature\cleardoublepage
\fi
\ifacknowledge
	\chapter*{\acknowledgementstitle}\thispagestyle{plain}
	\@acknowledgements\cleardoublepage
\fi
\ifabstract
	\chapter*{\abstracttitle}\thispagestyle{plain}
	\begin{abstract}
		\@abstracttext
	\end{abstract}\cleardoublepage
\fi

\pagestyle{frontmatter}

\iftcontents
	\tableofcontents
\fi
\iftfigures
	\listoffigures
\fi
\ifttables
	\listoftables
\fi
\clearpage\pagestyle{plain}
\cleardoublepage\pagestyle{main}
\iffancypagenumbers
	\pagenumbering{arabic}
	\setcounter{page}{1}
\fi
}

\relax
