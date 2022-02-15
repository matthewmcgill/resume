% Intro Options
\ProvidesClass{deedy-resume-openfont}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

% Package Imports
\usepackage[hmargin=1.25cm, vmargin=0.7cm]{geometry}
\usepackage[usenames,dvipsnames]{xcolor}
\usepackage{hyperref}
\hypersetup{
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={},
  colorlinks=false,
  hidelinks=true
}

\usepackage{titlesec}
\usepackage[absolute]{textpos}
\usepackage[UKenglish]{babel}
\usepackage[UKenglish]{isodate}
\usepackage{fontspec,xltxtra,xunicode}
\usepackage{enumitem,array,setspace,parskip}

% Needed to use \ifxetex-\else-\fi statement
\usepackage{xcolor,ifxetex,xifthen,etoolbox}

%\usepackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
\usepackage[math-style=TeX]{unicode-math}

% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\usepackage{fontawesome}
% Needed to make header & footer effeciently
\usepackage{fancyhdr}
 
%\usepackage{natbib}
\usepackage[
    backend=biber,
    style=authoryear,
    sorting=ydnt,
    url=false, 
    doi=false,
    maxbibnames=99]{biblatex}

\usepackage{xpatch}% or use http://tex.stackexchange.com/a/40705

%\def\faMobile{\symbol{"F10B}}
% Configure a directory location for fonts(default: 'fonts/')
%\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
%\fontdir

% Color definitions
\definecolor{date}{HTML}{666666}
\definecolor{black}{HTML}{000000}
%\definecolor{primary}{HTML}{2b2b2b}
\definecolor{primary}{HTML}{010101}
%\definecolor{headings}{HTML}{6A6A6A}
%\definecolor{headings}{HTML}{5A9A9A}
\definecolor{headings}{HTML}{4A8A9A}
\definecolor{subheadings}{HTML}{333333}

% Set main fonts
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Color=primary, Path = fonts/lato/]{Lato-Lig}
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight}
\newcommand{\custombold}[1]{\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\selectfont #1 \normalfont}

\newcommand*{\headerfirstnamestyle}[1]{{\fontspec[Path = fonts/lato/]{Lato-Hai}\fontsize{30pt}{10cm}\selectfont #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{30pt}{10cm}\selectfont #1}}
\newcommand*{\headerpositionstyle}[1]{{\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{13pt}{16pt}\selectfont #1}}
\newcommand*{\headeraddressstyle}[1]{{\color{subheadings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont #1}}
\newcommand*{\headersocialstyle}[1]{{\color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont #1}}
\newcommand*{\headerquotestyle}[1]{{\color{primary}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{12pt}{15pt}\selectfont #1}}

\newcommand*{\recipienttitlestyle}[1]{{\color{black}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont #1}}
\newcommand*{\recipientaddressstyle}[1]{{\color{primary}\fontspec[Path = fonts/raleway/]{Raleway-Light}\fontsize{11pt}{13pt}\selectfont #1}}
\newcommand*{\lettertitlestyle}[1]{{\color{primary}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\color{primary}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{11pt}{13pt}\selectfont #1}}

%\newcommand*{\lettertextstyle}{\color{primary}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont}
\newcommand*{\lettertextstyle}{\normalfont}
%\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.4em}\bodyfontlight\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\color{primary}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont #1}}
\newcommand*{\letterenclosurestyle}[1]{{\color{primary}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont #1}}

% Date command
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\textblockorigin{0mm}{5mm} % start everyth
%\newcommand{\lastupdated}{\begin{textblock}{60}(165,0)
\newcommand{\lastupdated}{\begin{textblock}{60}(155,0)
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{7pt}{9pt}\selectfont 
Last updated on
\today
\end{textblock}}

% Name command
\newcommand{\namesection}[3]{
	\centering{
		\sffamily
%		\fontspec[Path = fonts/lato/]{Lato-Hai}\fontsize{40pt}{10cm}\selectfont #1 
		\fontspec[Path = fonts/lato/]{Lato-Hai}\fontsize{30pt}{10cm}\selectfont #1 
		\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont #2
	} \\
	\vspace{5pt}
	\centering{ \color{headings}\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont #3}
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}}
	\vspace{-15pt}
}
\titlespacing{\section}{0pt}{0pt}{0pt}

% Headings command
\titleformat{\section}{\color{headings}
%\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{} {0em}{}
\scshape\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{11pt}{14pt}\selectfont \raggedright\uppercase}{} {0em}{}

% Subeadings command
\titleformat{\subsection}{\color{subheadings}
%\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{11pt}{11pt}\selectfont\bfseries\uppercase}{}{0em}{}
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\parskip}{-\parskip}
\newcommand{\runsubsection}[1]{\color{subheadings}
%\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1}
\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{11pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

% Descriptors command
\newcommand{\descript}[1]{\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

% Location command
\newcommand{\location}[1]{\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

% Section seperators command
\newcommand{\sectionsep}[0]{\vspace{8pt}}

% Bullet Lists with fewer gaps command
\newenvironment{tightemize}{\vspace{-\topsep} \begin{itemize}[leftmargin=4mm] \leftmargin1.0mm \itemsep1pt \parskip0pt \parsep0pt}{\end{itemize}\vspace{-\topsep}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
% Define separator for social informations in header
% Usage: \headersocialsep{<separator>}
% Default: \quad\textbar\quad
\newcommand*{\headersocialsep}[1][\quad\textbar\quad]{\def\@headersocialsep{#1}}
\headersocialsep


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Use to draw horizontal line with specific tickness
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}


%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}{
  \begin{center}
    \headerfirstnamestyle{
      \@firstname
    } \headerlastnamestyle{
      \@lastname
    }
    \\
    \vspace{0.4mm}
    \ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\}}
    \vspace{0.4mm}
    \ifthenelse{\isundefined{\@address}}{}{\headeraddressstyle{\@address\\}}
%    \vspace{-0.5mm}
    \headersocialstyle{
      \newbool{isstart}
      \setbool{isstart}{true}
      \ifthenelse{\isundefined{\@mobile}}
        {}
        {
          \faMobilePhone\ \@mobile
          \setbool{isstart}{false}
        }
      \ifthenelse{\isundefined{\@email}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{istart}{false} 
            }
            {\@headersocialsep}
          \href{mailto:\@email}{\faEnvelope\ \@email}
        }
      \ifthenelse{\isundefined{\@homepage}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{istart}{false} 
            }
            {\@headersocialsep}
          \href{http://\@homepage}{\faHome\ \@homepage}
        }
      \ifthenelse{\isundefined{\@github}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{istart}{false} 
            }
            {\@headersocialsep}
          \href{https://github.com/\@github}{\faGithubSign\ \@github}
        }
%      \ifthenelse{\isundefined{\@stackoverflowid}}
%        {}
%        {
%          \ifbool{isstart}
%            {
%              \setbool{istart}{false} 
%            }
%            {\@headersocialsep}
%          \href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\ \@stackoverflowname}
%        }
      \ifthenelse{\isundefined{\@linkedin}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{istart}{false} 
            }
            {\@headersocialsep}
          \href{https://www.linkedin.com/in/\@linkedin}{\faLinkedin\ \@linkedin}
        }
      \ifthenelse{\isundefined{\@twitter}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{istart}{false} 
            }
            {\@headersocialsep}
          \href{https://twitter.com/\@twitter}{\faTwitter\ \@twitter}
        }
      \ifthenelse{\isundefined{\@skype}}
        {}
        {
          \ifbool{isstart}
            {
              \setbool{istart}{false} 
            }
            {\@headersocialsep}
          \faSkype\ \@skype
        }
    } \\
    \ifthenelse{\isundefined{\@quote}}
      {}
      {\vspace{6.0mm}\headerquotestyle{\@quote\\}\vspace{5.0mm}}
  \end{center}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{
  \fancyfoot{}
  \fancyfoot[L]{
    \footerstyle{#1}
  }
  \fancyfoot[C]{
    \footerstyle{#2}
  }
  \fancyfoot[R]{
    \footerstyle{#3}
  } 
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}{
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{12.5cm} R{4.5cm}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \recipientaddressstyle{\@recipientaddress} \\\\
  \end{singlespace}
  \ifthenelse{\isundefined{\@lettertitle}}
    {}
    {\lettertitlestyle{\@lettertitle} \vspace{5mm} \\ }
  \vspace{5mm}
  \lettertextstyle{\@letteropening} 
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{
  \vspace{3.4mm}
  \lettertextstyle{\@letterclosing} \\\\
  \letternamestyle{\@firstname \hspace{0.0cm} \@lastname}
  \ifthenelse{\isundefined{\@letterenclosure}}
    {\\}
    {
      \\\\\\
      \letterenclosurestyle{\@letterenclname:  \@letterenclosure} \\
    }
}


% Define a paragraph for cvletter
% Usage: \cvparagraph{<paragraph-title>}
\newcommand{\cvparagraph}[1]{
  \par\addvspace{2.5ex}
  \phantomsection{}
  \normalfont{#1}
  \color{gray}\vhrulefill{0.9pt}
  \par\nobreak\addvspace{0.4ex}
}

\newenvironment{cvletter}{
  \lettertextstyle
}{
}

%%%%
% Bold author names
%%%%

%\newbibmacro*{name:bold}[2]{%
%  \def\do##1{\iffieldequalstr{hash}{##1}{\bfseries\listbreak}{}}%
%  \dolistloop{\boldnames}%
%}
\newbibmacro*{name:bold}[2]{%
  \def\do##1{\iffieldequalstr{hash}{##1}{\custombold}{}}%
  \dolistloop{\boldnames}%
}

\newcommand*{\boldnames}{}

\xpretobibmacro{name:last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:first-last}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:last-first}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:last}{\endgroup}{}{}
\xapptobibmacro{name:first-last}{\endgroup}{}{}
\xapptobibmacro{name:last-first}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}

