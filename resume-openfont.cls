% Intro Options
\ProvidesClass{resume-openfont}[2021/05/30 Abdullah's version]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%--------------------------------------------------------------
% Package Imports
\RequirePackage[english]{babel}
% page setup 
\RequirePackage{fancyhdr}
% Set boundaries
\RequirePackage[hmargin=.7cm, vmargin=0.94cm]{geometry}
% remove ugly boxes around links
\usepackage[hidelinks]{hyperref}
% setup custom titles
\RequirePackage{titlesec}
% For skills table
\RequirePackage{enumitem}
% Using tables like the profile section
\RequirePackage{tabularx}
% Used for the link symbol
\RequirePackage{fontawesome}
% Set up font 
\RequirePackage{lato-font}

% make underlying constants: credits to Alex Beattie for noticing and suggesting fix
\RequirePackage{ulem}
%--------------------------------------------------------------
% Reformatting default sections
% section
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\section}{%
\color[HTML]{1f497d}% Using comments to allow us to split the command across multiple line
\scshape%
\customLatoBold%
\fontsize{12pt}{12pt}%first number is size, second number is space between lines
\selectfont%
\raggedright%
\uppercase%
} {}{0em}{}

% % subsection
% \titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
% \titleformat{\subsection}{%
% \color{headings}%
% \customLatoBlack%
% \fontsize{12pt}{12pt}%
% \selectfont%
% \bfseries%
% \uppercase%
% \normalfont% Normal font is used to reset the customization, so it doesn't bleed into anything else
% } {}{0em}{}

% create under line


\newcommand{\sectionUnderline}[0]{
\vspace{-10pt}
\noindent\textcolor[HTML]{1f497d}{\rule{\textwidth}{.7pt}}
\textcolor[HTML]{000000}{}\par
\vspace{-10pt}
}


% remove header footer stuff like page numbers 
\newcommand{\resetHeaderAndFooter}{%
\fancyhf{}%
\fancyfoot{}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}
%--------------------------------------------------------------
% Formatting commands - commands to control spacing

% A shortcut to control spacing
\newcommand{\NoSpace}{\vspace*{-2pt}}

% Command to simulate new line, to fix spacing glitches
\newcommand{\fakeNewLine}{\newline \vspace{-\baselineskip}}

% Command to align table at the start of the resume
\newcommand{\alignProfileTable}{
    \raggedbottom
    \raggedright
    \setlength{\tabcolsep}{0in}
}

%--------------------------------------------------------------
% headings command - create different types of heading
\newcommand{\runsubsection}[1]{%
\color{headings}%
\customLatoBlack%
\fontsize{12pt}{12pt}%
\selectfont%
\bfseries%
#1%
\normalfont}%

% Descriptors command
\newcommand{\descript}[1]{%
\color{headings}%
\raggedright%
% \scshape%
\customLatoRegular%
\fontsize{11pt}{13pt}%
\selectfont{#1}%
\normalfont}

% Location command
\newcommand{\location}[1]{%
\color{headings}%
\raggedright%
\customLatoBlack%
\fontsize{11pt}{13pt}%
\selectfont{#1}%
\normalfont}

% Minor command - like even smaller sub section
\newcommand{\minorSection}[1]{%
\color{headings}%
\raggedright%
\scshape%
\customRalewayMedium%
\fontsize{11pt}{12pt}%
\selectfont{#1}%
\normalfont}

% Project command
\newcommand{\Project}[2]{
\runsubsection{%
\href{#2}{\uppercase{#1} \,\faExternalLink}
}
    \hfill
}

% Underlined link command
\newcommand{\underlinedLink}[2]{%
\href{#1}{\uline{#2}}%
}

% Command for table 
\newcommand{\singleItem}[2]{\normalsize{\textbf{#1} #2}}
\newcommand{\doubleItem}[4]{\singleItem{#1}{#2} & \singleItem{#3}{#4}}

%--------------------------------------------------------------
% Section separators command
\newcommand{\sectionsep}[0]{\vspace{9pt}}

%--------------------------------------------------------------
% Bullet Lists with fewer gaps command
\newenvironment{bullets}{
\normalsize
\fontsize{10pt}{10pt}
\vspace{-1mm}
\begin{itemize}[leftmargin=*]
\itemsep1pt 
\parskip1.5pt 
\parsep1.5pt
}{
\end{itemize}
\vspace{-\topsep}
}

% Command for skill table
\newenvironment{skillList}{%
\noindent%
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}%
}{%
\end{tabular*}%
}

%--------------------------------------------------------------
% Customize built-in commands
% Align Sections
\let\oldSection\section
\renewcommand{\section}[1]{\oldSection{#1}\raggedright}
\renewcommand{\underline}[1]{\uline{#1}}