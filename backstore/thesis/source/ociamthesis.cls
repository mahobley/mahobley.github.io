% ociamthesis
% 
% Originally by Keith A. Gillow (gillow@maths.ox.ac.uk), 1997
% Modified by Sam Evans (sam@samuelevansresearch.org), 2007
% Modified by John McManigle (john@oxfordechoes.com), 2015
% Modified by Theo Costain (costain@robots.ox.ac.uk), 2023
%
% This version Copyright (c) 2023 Theo Costain
%
% Broad permissions are granted to use, modify, and distribute this software
% as specified in the MIT License included in this distribution's LICENSE file.
%
%
% TC Notes:
% - Originally has lots of "\usepackage" all over the place,
% but as this is a classfile, those should all be "\RequirePackage" technically so have updated/
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ociamthesis}[2023/04/07 Oxford thesis class]
%-------------------------- initial code -----------------------

% JEM: Defaults to one-side, but passing 'twoside' should set everything up for that
\LoadClass[openright,12pt,a4paper]{report}

\newif\ifmc@nobind
\mc@nobindfalse

\DeclareOption{nobind}{\mc@nobindtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\setlength{\parskip}{0pt plus 1pt}
\setlength{\parfillskip}{0pt plus .7\textwidth}

% JEM: Lengths for single spacing (ie separate abstract, captions), front matter (abstract,
%   acknowledgements, table of contents, etc), and main body text.
\newlength{\singlebaselineskip}
\newlength{\frontmatterbaselineskip}
\newlength{\textbaselineskip}

\setlength{\singlebaselineskip}{\baselineskip}
\setlength{\frontmatterbaselineskip}{17pt plus1pt minus1pt}
\setlength{\textbaselineskip}{22pt plus2pt}
% \setlength{\baselineskip}{\textbaselineskip}

\newcommand{\submittedtext}{{A thesis submitted for the degree of}}
\RequirePackage{varwidth}
\newcommand{\originalitytext}{%
    \rule[-2mm]{1pt}{7mm}\hspace{-1pt}%
    \rule[-2mm]{7mm}{1pt}\hspace{-1pt}%
    \rule[-2mm]{1pt}{7mm}\hspace{-7mm}%
    \rule[5mm]{7mm}{1pt}\hspace{1em}%
    \begin{varwidth}{\textwidth}I hereby certify that this is entirely\\my own work unless otherwise stated.\end{varwidth}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (eg Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}
% Your candidate number (ie for master's submissions)
\def\candidateno#1{\gdef\@candidateno{#1}}
% Your word count (for master's submissions)
\def\wordcount#1{\gdef\@wordcount{#1}}
\newif\ifmasterssubmission
% adds candidate number and word count in place of name and college
\masterssubmissionfalse


%
% CRESTS
%

\def\crest{{\includegraphics[width=40mm]{files/titlepage/uni_logo.png}}}


%
% Define text area of page and margin offsets
%

\ifmc@nobind
    \RequirePackage[includehead,hmargin={3.1cm, 3.1cm}, vmargin={2.5cm,2.7cm}, headsep=.8cm,footskip=1.2cm]{geometry}
\else
    \RequirePackage[includehead,hmargin={3.6cm, 2.6cm}, vmargin={2.5cm,2.7cm}, headsep=.8cm,footskip=1.2cm]{geometry}
\fi

\RequirePackage{xcolor}
\RequirePackage{graphicx}

\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}
\fancyhf{} % clear the header and footers
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{\thechapter. #1}}
\renewcommand{\sectionmark}[1]{\markright{\thesection. #1}}
\renewcommand{\headrulewidth}{0pt}

% % MAH
% \if@twoside%
%     \fancyhead[LO]{\emph{\leftmark}}
%     \fancyhead[RE]{\emph{\rightmark}}
%     \fancyhead[RO,LE]{\emph{\thepage}}
% \else%
%     \fancyhead[L]{\emph{\leftmark}}
%     \fancyhead[R]{\emph{\rightmark}}
%     \fancyhead[R,L]{\emph{\thepage}}
% \fi%
    
% MAH
\if@twoside%
    \fancyhead[LO]{\emph{\leftmark}}
    \fancyhead[RE]{\emph{\rightmark}}
    \fancyhead[RO,LE]{\emph{\thepage}}
\else%
    \fancyhead[L]{\emph{\leftmark}}
    \fancyhead[R]{\emph{\rightmark}}
    \fancyhead[R]{\emph{\thepage}}
    % \fancyfoot[R]{\emph{\thepage}}
    
\fi%

% \fancyfoot[R]{\thepage} 

% \fancypagestyle{plain}{\fancyhf{}\fancyfoot[C]{\emph{\thepage}}}
% \fancypagestyle{plain}{\fancyhf{}\fancyfoot[R]{\emph{\thepage}}}
% \fancypagestyle{plain}{\fancyhf{}\fancyhead[R]{\emph{\thepage}}}
\fancypagestyle{plain}{\fancyhf{}}

% \fancypagestyle{plain}{\fancyhead{}\renewcommand{\headrule}{}}
% \fancypagestyle{plain}{\fancyfoot[R]{\emph{\thepage}}}
% \fancypagestyle{plain}{\fancyhead[R]{\emph{\thepage}}}


% JEM fix header on cleared pages for openright
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
            \hbox{}
            \fancyhead[RE,LO]{}
            \newpage
            \if@twocolumn\hbox{}\newpage
            \fi
            \fancyhead[LO]{\emph{\leftmark}}
            \fancyhead[RE]{\emph{\rightmark}}
        \fi\fi}


\RequirePackage{microtype}
\RequirePackage{nicefrac}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{textcomp}

\RequirePackage{longtable}
% Allows tables to span multiple pages (this package must be called before hyperref)

\RequirePackage[font=small,labelfont=bf]{caption}
% Nicer captions

\RequirePackage{multicol,multirow,array}
% Used to make multiple columns for the indices and for creating columns that span multiple rows in tables

\RequirePackage{rotating}
% To allow tables in landscape mode

\RequirePackage{booktabs}
% For better looking tables

\RequirePackage{pdfpages}
% Allows multi-page pdfs to be inserted as graphics

\RequirePackage{xfrac}

\RequirePackage{enumerate}
% Allows different numbering styles for Lists
% to use:
% \begin{enumerate}[x] 
% \item text 
% \end{enumerate} 
% where x is:
% A	uppercase letters (as produced by \Alph)
% a	lowercase letters (as produced by \alph)
% I	uppercase roman numerals (as produced by \Roman)
% i	lowercase roman numerals (as produced by \roman)
% 1	arabic numbers (as produced by \arabic)

% JEM the following package allows changing spacing in lists (for acknowledgements)
\RequirePackage{enumitem}

% JEM the following allows table columns aligned by decimal point
\RequirePackage{dcolumn}
\newcolumntype{d}[3]{D{.}{\cdot}{#1} }

\RequirePackage{appendix}
% For helping format appendicies
% \RequirePackage{notoccite} 
% To format the bibliography	

\PassOptionsToPackage{hyphens}{url}
% \RequirePackage[colorlinks=false,pdfpagelabels]{hyperref}
\RequirePackage[hidelinks]{hyperref}
% for linking between references, figures, TOC, etc in the pdf document

\RequirePackage[nohints,tight]{minitoc}
\setcounter{minitocdepth}{3}
% Generates mini tables of contents per chapter

% JEM: The following fixes minitoc to not be multiple-spaced.
\let\oldmtc@verse\mtc@verse
\renewcommand{\mtc@verse}[1]{\oldmtc@verse{#1}\setlength{\baselineskip}{\z@}}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
    \@restonecolfalse
    \if@twocolumn\@restonecoltrue\onecolumn
    \else\if@openright\cleardoublepage\else\clearpage\fi
    \fi}%
{\if@restonecol\twocolumn
    \else\newpage\thispagestyle{empty}\fi}


%define title page layout

\renewcommand{\maketitle}{%
    \begin{alwayssingle}\null
        \renewcommand{\footnotesize}{\small}
        \renewcommand{\footnoterule}{\relax}
        \thispagestyle{empty}
        \ifmasterssubmission
            \begin{center}
                \vspace*{-3ex}
                { \LARGE {\bfseries {\@title}} \par}
                {\large \vspace*{25mm} {\crest \par} \vspace*{20mm}}
                {{\Large Candidate no.\ \@candidateno} \par}
                {\large \vspace*{1ex}
                {Word count: {\@wordcount} \par}
                \vspace*{4ex}
                {{\submittedtext} \par}
                \vspace*{1ex}
                {\it {\@degree} \par}
                \vspace*{6ex}
                {{\originalitytext} \par}
                \vspace*{2ex}
                {\@degreedate}}
            \end{center}
        \else
            \begin{center}
            % MAH
             	% \vspace*{4em}
              \vfill
            	% \Large \textsc{Confirmation of Status}
              	\Huge \textbf{\@title}
               
            	\vspace*{3em}
             
                % \vspace*{9em}
            	\includegraphics[width=40mm]{files/titlepage/uni_logo.png}
             
            	\vspace*{2em}
             
            	% \Huge \textbf{\title}
            	% \vspace*{2em}
            	\Large \textit{\@author}
             
             	% \vspace*{1em}
            	\normalsize {\@college \\ University of Oxford}
             
            	\vspace*{3em}
             
                \normalsize
                A thesis submitted for the degree of \\
                \textit{\@degree}
            	% Supervised by Prof.\ Victor A.\ Prisacariu \\
                % Active Vision Lab 
                % \vspace*{1em}
                
                \@degreedate
                
            	\vfill
 
            % Original
                % { \LARGE {\bfseries {\@title}} \par}
                % {\large \vspace*{30mm} {\crest \par} \vspace*{25mm}}
                % {{\Large \@author} \par}
                % {\large \vspace*{1ex}
                %     {{\@college} \par}
                %     \vspace*{1ex}
                %     {University of Oxford \par}
                %     \vspace*{20mm}
                %     {{\submittedtext} \par}
                %     \vspace*{1ex}
                %     {\it {\@degree} \par}
                %     \vspace*{2ex}
                %     {\@degreedate}}
            \end{center}
        \fi
        \vfill\null
    \end{alwayssingle}}


% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
        \thispagestyle{empty}
        \vspace*{\fill} \begin{center}}
            {\end{center}\vspace*{\fill}\vspace*{\fill} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}%
{   \begin{alwayssingle}\chapter*{Acknowledgements}
        \thispagestyle{empty}
        \pagestyle{empty}
        \setlength{\baselineskip}{\frontmatterbaselineskip}
        }
        {\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract}%
{   \begin{alwayssingle}\chapter*{Abstract}
        \thispagestyle{empty}
        \pagestyle{empty}
        \setlength{\baselineskip}{\frontmatterbaselineskip}}
        {\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\newgeometry{margin=3.3cm}\thispagestyle{empty}\begin{alwayssingle}
        \begin{center}
            {\Large \bfseries \@title \par}
            \ifmasterssubmission
            {{\large \vspace*{3ex} Candidate no.\ \@candidateno} \par}
            \else
            {{\large \vspace*{2ex} \@author} \par}
            \fi
            {\large \vspace*{1ex}
            \ifmasterssubmission
                {Thesis word count: {\@wordcount} \par}
                \else
                {{\@college} \par}
                {University of Oxford \par}
            \fi
            \vspace*{1ex}
            {{\it \submittedtext} \par}
            {\it {\@degree} \par}
            \vspace*{2ex}
            {\@degreedate} \par}
            \vfill
            {\Large \bfseries  Abstract}
        \end{center}
        \vspace{1ex}
        \setlength{\baselineskip}{\z@}}
        {\vfill\end{alwayssingle}\restoregeometry}

\newenvironment{abstractnamed} {\newgeometry{margin=3.3cm}\thispagestyle{empty}\begin{alwayssingle}
        \begin{center}{\large \@author \hfill \@degree \par}
            {\large  \@college \hfill \@degreedate \par}
            \vspace*{2ex}
            {\Large \bfseries \@title \par}
            \vspace*{1ex}
            \vfill
            {\large \bfseries  Abstract}
        \end{center}
        \vspace*{1ex}
        \setlength{\baselineskip}{0.95\singlebaselineskip}}
        {\vfill\end{alwayssingle}\restoregeometry}

% STATEMENT OF ORIGINALITY (AS SUGGESTED BY GSW)
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{empty}
        \begin{center}
            \vspace*{1.5cm}
            % {\Large \bfseries Statement of Originality}
        \end{center}
        \vspace{0.5cm}
        \setlength{\baselineskip}{\frontmatterbaselineskip}
        \begin{quote}}
            {\end{quote}\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).
%
% Edited by JEM

\newenvironment{romanpages}
{\cleardoublepage\setlength{\baselineskip}{\frontmatterbaselineskip}\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\arabic{page}}}


%Figure placement on page
%
%This is to help prevent too many figures on their own pages.  I got it from:
% http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#captfont

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}

% JEM: VERSE, QUOTATION, and QUOTE must be single-spaced.
% These rename the internal commands for the \begin{...} and
% \end{...} environment commands.
\let\@ldquote=\quote
\let\@ldendquote=\endquote
\renewenvironment{quote}
{\@ldquote\setlength{\baselineskip}{\singlebaselineskip}}
{\@ldendquote}

\let\@ldqttn=\quotation
\let\@ldendqttn=\endquotation
\renewenvironment{quotation}
{\@ldqttn\setlength{\baselineskip}{\singlebaselineskip}}
{\@ldendqttn}

\let\@ldverse=\verse
\let\@ldendverse=\endverse
\renewenvironment{verse}
{\@ldverse\setlength{\baselineskip}{\singlebaselineskip}}
{\@ldendverse}

% % JEM: Stuff for List of Abbreviations (or Glossary or other list)
% \RequirePackage{calc}
% \newcommand{\t@cfill}{\cleaders\hbox{$\m@th \mkern\@dotsep mu . \mkern\@dotsep mu$}\hfill}
% \newcommand{\abbrl@bel}[1]{\makebox[\labelwidth][l]{\textbf{#1}\ \t@cfill}}
% \newenvironment{mclistof}[2]{%
%     \chapter*{#1}%
%     \addcontentsline{toc}{chapter}{#1}
%     \begin{list}{}%
%         {\renewcommand{\makelabel}{\abbrl@bel}%
%             \setlength{\labelwidth}{#2}%
%             \setlength{\leftmargin}{\labelwidth+\labelsep}%
%             \setlength{\itemsep}{0pt}%
%             \markboth{#1}{#1}%
%         }}
%         {\end{list}\mtcaddchapter}


\RequirePackage[grey,utopia]{quotchap}
% To put nice quotes at the beginning of the chapters

\RequirePackage[nottoc]{tocbibind}
% Used for inserting the Bibliography, List of Figures, indices, etc into the table of contents.

% JEM: Allow flexible spacing after figures, to reduce other stretching
\setlength{\textfloatsep}{20pt plus15pt minus4pt}

% JEM: Fix paragraph spacing within quotes for multi-par quotes
\renewenvironment{savequote}[1][10cm]{%
    \begin{lrbox}{\@quotebox}
        \begin{minipage}[t]{#1}\footnotesize\slshape%
            \setlength{\parskip}{6pt}}{%
            \unskip\end{minipage}\end{lrbox}
    \global\setbox\@quotebox\copy\@quotebox
    \global\let\@printcites\@iprintcites
    \ignorespacesafterend}
\renewcommand{\qauthor}[1]{\par
    {\raggedleft\upshape #1\qquad\hbox{}\par}\bigskip}

% JEM: All of this is so that headers in these sections aren't uppercase
\let\@ldtoc\tableofcontents
\renewcommand*\tableofcontents{{%
            \renewcommand*\MakeUppercase[1]{##1}\@ldtoc}}
\let\@ldlof\listoffigures
\renewcommand*\listoffigures{{%
            \renewcommand*\MakeUppercase[1]{##1}\@ldlof}}
\let\@ldlot\listoftables
\renewcommand*\listoftables{{%
            \renewcommand*\MakeUppercase[1]{##1}\@ldlot}}
\let\@ldbib\bibliography
\renewcommand*\bibliography[1]{{%
            \renewcommand*\MakeUppercase[1]{##1}\@ldbib{#1}}}

% JEM: for crazy multi character set quotes and Unicode and all
\RequirePackage{lmodern}
\RequirePackage[LGR,TS1,T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[greek,latin,english]{babel}
\RequirePackage{csquotes}
\hyphenpenalty=500
\def\longs{{\fontencoding{TS1}\selectfont s}}

% JEM: for highlighting corrections
\newlength{\mccurrentbaselineskip}
\newlength{\mccurrentparskip}
\newlength{\mccurrentparindent}
\newif\ifcorrections
\newif\ifm@csection
\m@csectionfalse
\correctionsfalse

\colorlet{shadecolor}{blue!20}

\RequirePackage{framed}
\OuterFrameSep=-9pt
\newenvironment{mccorrection}
{\ifcorrections\if@nobreak\m@csectiontrue\fi\begin{shaded}\ifm@csection\noindent\ignorespaces\fi\fi}
            {\ifcorrections\end{shaded}\m@csectionfalse\ifx\@captype\@undefined\@nobreakfalse\fi\fi}

\RequirePackage{soul}
\sethlcolor{shadecolor}
\newcommand{\mccorrect}[1]{\ifcorrections\hl{#1}\else#1\fi}


% JEM: adjust start-of-chapter spacing
\renewcommand{\chapterheadstartvskip}{\vspace*{40pt}}
\renewcommand{\chapterheadendvskip}{\vspace{30pt}}


% JEM: combine all of the commands you run before appendices start
\newcommand{\startappendices}
{\appendix\adjustmtc\noappendicestocpagenum\addappheadtotoc\appendixpage}


% TC: Add macros for common abbreviations (I think these commands come from conference templates)
% Add a period to the end of an abbreviation unless there's one
% already, then \xspace.
\RequirePackage{xspace}
\makeatletter
\DeclareRobustCommand\onedot{\futurelet\@let@token\@onedot}
\def\@onedot{\ifx\@let@token.\else.\null\fi\xspace}

\def\eg{\emph{e.g}\onedot} \def\Eg{\emph{E.g}\onedot}
\def\ie{\emph{i.e}\onedot} \def\Ie{\emph{I.e}\onedot}
\def\cf{\emph{c.f}\onedot} \def\Cf{\emph{C.f}\onedot}
\def\st{\emph{s.t}\onedot}
\def\etc{\emph{etc}\onedot} \def\vs{\emph{vs}\onedot}
\def\wrt{w.r.t\onedot} \def\dof{d.o.f\onedot}
\def\etal{\emph{et al}\onedot}
\def\aka{\emph{a.k.a}\onedot}
\makeatother