%% iRASthesis.cls
%%
%% LaTeX2e class for theses
%%
%% This template is derived work of KIT thesis template: https://github.com/KITrobotics/Latex_Template by Timo Rohrberg, Thorsten Haberecht and Denis Štogl
%% Adaptation by Gergely Sóti, H-KA iRAS Prof. Hein, 2021; gergely.soti@h-ka.de
%
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Gergely Sóti gergely.soti@h-ka.de.
%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{iRASthesis}

\newif\ifiRASthesis@german
\newif\ifiRASthesis@bachelor
\newif\ifiRASthesis@master
\newif\ifiRASthesis@project
\newif\ifiRASthesis@blue
\newif\ifiRASthesis@red
\newif\ifiRASthesis@lightblue

\DeclareOption{german}{\iRASthesis@germantrue}
\DeclareOption{ngerman}{\iRASthesis@germantrue}

\DeclareOption{bachelor}{\iRASthesis@bachelortrue}
\DeclareOption{master}{\iRASthesis@mastertrue}
\DeclareOption{project}{\iRASthesis@projecttrue}
\DeclareOption{blue}{\iRASthesis@bluetrue}
\DeclareOption{red}{\iRASthesis@redtrue}
\DeclareOption{lightblue}{\iRASthesis@lightbluetrue}

\ProcessOptions\relax

\newcommand{\thesistype}{}
\ifiRASthesis@bachelor
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Bachelorarbeit}{Bachelor's Thesis}}
\fi
\ifiRASthesis@master
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Masterarbeit}{Master's Thesis}}
\fi
\ifiRASthesis@project
  \renewcommand{\thesistype}{\iflanguage{ngerman}{Projektarbeit}{Project Paper}}
\fi

\ifiRASthesis@german
  % English is also needed in German thesis for the abstract
  \usepackage[main=ngerman,english]{babel}
\else
  % German is also needed in English thesis for the abstract
  \usepackage[main=english,ngerman]{babel}
\fi

\LoadClass[12pt,twoside,headsepline,a4paper,titlepage,DIV=15,BCOR=20mm,footheight=14.5pt]{scrbook}

\RequirePackage[automark,headsepline,plainheadsepline]{scrlayer-scrpage}
% \setlength{\footheight}{14.5pt}
\clubpenalty=10000 %prevent orphans
\widowpenalty=10000 %prvent widows

\input{document_setup}
\newcommand{\changefont}[3]{\fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}
\newcommand{\chapterheadfont}{}
\newcommand{\blankpage}{
 \clearpage{\cleardoublepage}
}


\setcounter{secnumdepth}{3} % Numbering also for \subsubsections
\setcounter{tocdepth}{3}    % Register \subsubsections in content directory

\setpapersize{A4}
\setmarginsrb{3cm}{1cm}{3cm}{1cm}{6mm}{7mm}{5mm}{15mm}

\usepackage{indentfirst}
\parindent 20pt                     % Indent beginning of all paragraphs
\parskip1.5ex plus0.5ex minus0.5ex % Margin between paragraphs

\renewcommand\appendix{\par
   \chaptermark{\appendixname}
   \setcounter{section}{0}%
   \setcounter{subsection}{0}%
   \setcounter{figure}{0}%
   \renewcommand\thesection{\Alph{section}}%
   \renewcommand\thefigure{\Alph{section}.\arabic{figure}}
   \renewcommand\thetable{\Alph{section}.\arabic{table}}}


\titlehead{
\ifiRASthesis@blue
    \includegraphics[scale=0.35, valign=t]{logos/HKA_W_Wortmarke_CMYK}
    \hspace*{\fill}
    \includegraphics[scale=0.35, valign=t]{logos/HKA_W_Bildmarke_CMYK}
\else
    \ifiRASthesis@red
        \includegraphics[scale=0.35, valign=t]{logos/HKA_Wortmarke-v_CMYK}
        \hspace*{\fill}
        \includegraphics[scale=0.35, valign=t]{logos/HKA_Bildmarke-v_CMYK}
    \else
        \includegraphics[scale=0.35, valign=t]{logos/HKA_MMT_Wortmarke_CMYK.eps}
        \hspace*{\fill}
        \includegraphics[scale=0.35, valign=t]{logos/HKA_MMT_Bildmarke_CMYK.eps}
    \fi
\fi

\begin{textblock}{10}[0,0](3.5,16.8)
  \small\changefont{phv}{m}{n}{
	\iflanguage{ngerman}
		{H-KA -- Hochschule Karlsruhe}
		{H-KA -- Karlsruhe University of Applied Sciences}
  }
\end{textblock}
\begin{textblock}{10}[0,0](15,16.75)
  \small{
	\textbf{www.h-ka.de}
  }
\end{textblock}

}

\setkomafont{title}{\Huge\changefont{phv}{m}{n}}
\setkomafont{subtitle}{\large\changefont{phv}{m}{n}}
\setkomafont{author}{\Large\changefont{phv}{m}{n}}

\def\@author{}
\renewcommand{\author}[1]{
    \def\@author{#1}
}

\newcommand{\thefaculty}{
\ifiRASthesis@project
      \iflanguage{ngerman}
      {Fakult\"at f\"ur Maschinenbau und Mechatronik (MMT)  \\ in Zusammenarbeit mit}
      {Faculty for Mechanical Engineering and Mechatronics (MMT) \\ in cooperation with }
\else
      \iflanguage{ngerman}
   {Fakult\"at f\"ur Wirtschaftswissenschaften}
   {Faculty for Management Science and Engineering}
 \fi
  }
\newcommand{\faculty}[1]{\renewcommand{\thefaculty}{#1}}

\newcommand{\theinstitute}{
  \iflanguage{ngerman}
   {Institut f\"ur Angewandte Forschung (IAF) \\ Robotik und Autonome Systeme (iRAS)}
   {Institute for Applied Research (IAF) \\ Robotics and Autonomous Systems (iRAS)}
  }
\newcommand{\institute}[1]{\renewcommand{\theinstitute}{#1}}

\newcommand{\theinstituteaddress}{
  Campus Hochschule Karlsruhe 2030+ / Technologiepark \\ Wilhelm-Schickard-Straße 9, \\Gebäude F
  }
\newcommand{\instituteaddress}[1]{\renewcommand{\theinstituteaddress}{#1}}

\newcommand{\theinstitutecity}{
  76131 Karlsruhe
  }
\newcommand{\institutecity}[1]{\renewcommand{\theinstitutecity}{#1}}

\newcommand{\thereviewerone}{}
\newcommand{\reviewerone}[1]{\renewcommand{\thereviewerone}{#1}}
\newcommand{\thereviewertwo}{}
\newcommand{\reviewertwo}[1]{\renewcommand{\thereviewertwo}{#1}}

\newcommand{\theeditstart}{}
\newcommand{\theeditend}{}

\newcommand{\editingtime}[2]{
\renewcommand{\theeditstart}{#1}
\renewcommand{\theeditend}{#2}
}
%% do not show the date
\date{}

\newcommand{\theaddress}[1]{}
\newcommand{\address}[1]{\renewcommand{\theaddress}{#1}}
\newcommand{\thecity}[1]{}
\newcommand{\city}[1]{\renewcommand{\thecity}{#1}}
\newcommand{\theemail}[1]{}
\newcommand{\email}[1]{\renewcommand{\theemail}{#1}}

\newcommand{\thetitleotherlanguage}{}
\newcommand{\titleotherlanguage}[1]{\renewcommand{\thetitleotherlanguage}{#1}}
\newcommand{\thesubtitleotherlanguage}{}
\newcommand{\subtitleotherlanguage}[1]{\renewcommand{\thesubtitleotherlanguage}{#1}}
\newcommand{\thekeywords}{}
\newcommand{\keywords}[1]{\renewcommand{\thekeywords}{#1}}
\newcommand{\thekeywordsotherlanguge}{}
\newcommand{\keywordsotherlanguge}[1]{\renewcommand{\thekeywordsotherlanguge}{#1}}

%% Thesis type handling
\newcommand{\thethesistype}{}
\newcommand{\studyprogram}[1]{\subtitle{\vspace*{1cm} \iflanguage{ngerman}{\thesistype\\ ~\\von}{\thesistype\\ ~\\of}}
\renewcommand{\thethesistype}{#1}}

\usepackage{colortbl}
\usepackage{xcolor} 
\definecolor{hka-red}{cmyk}{0,0.35294117647,0.39215686274,0.01960784313}
\definecolor{hka-blue}{cmyk}{0.39215686274,0.27450980392,0,0}
\definecolor{hka-lightblue}{cmyk}{0.3725490196,0.03921568627 ,0,0}

\newcommand{\hkadrawline}{
    \ifiRASthesis@blue
        \noindent\textcolor{hka-blue}{\rule{15cm}{1mm}}
    \else
        \ifiRASthesis@red
            \noindent\textcolor{hka-red}{\rule{15cm}{1mm}}
        \else
             \noindent\textcolor{hka-lightblue}{\rule{15cm}{1mm}}
        \fi
    \fi
}

\newcommand{\settitle}{
  \publishers{
    {\changefont{phv}{m}{n}\selectfont
    \begin{flushleft}
        \large
        
        \iflanguage{ngerman}{\ifiRASthesis@bachelor Bachelorarbeit \else \ifiRASthesis@master Masterarbeit \else Projektarbeit \fi \fi}{\ifiRASthesis@bachelor Bachelor's Thesis \else \ifiRASthesis@master Master's Thesis \else Project Paper \fi \fi}\\
        \iflanguage{ngerman}{vorgelegt  \ifiRASthesis@bachelor zur Erlangung des Bachelorgrades \else \ifiRASthesis@master zur Erlangung des Mastergrades \else im Rahmen des Studiengangs Robotik und künstliche Intelligenz in der Produktion  \fi \fi}{in partial fulfilment of the requirements for the \ifiRASthesis@bachelor Bachelor's \else \ifiRASthesis@master Master's degree \else Robotics and Artificial Intelligence in Production Master's course \fi \fi}\\
        \iflanguage{ngerman}{der Hochschule Karlsruhe}{at Karlsruhe University of Applied Sciences}
        \vspace*{0.8cm}
        
        \iflanguage{ngerman}{An der\thefaculty}{At the\thefaculty} \\
        \theinstitute
    
        \vspace*{0.8cm}
        \noindent\begin{tabular}{@{}lcl}
        	\ifthenelse{\equal{\thereviewertwo}{}}{\iflanguage{ngerman}{Gutachter}{Reviewer}: & \hfill  & \thereviewerone \\
        	}{\iflanguage{ngerman}{Erstgutachter/in}{First reviewer}: & \hfill & \thereviewerone \\
        	  \iflanguage{ngerman}{Zweitgutachter/in}{Second reviewer}: & \hfill & \thereviewertwo \\
        	}
        \end{tabular}
    
        \vspace{1.6cm}
        \normalsize{
            \theeditstart{} -- \theeditend
        }
        \end{flushleft}
    }
  }
  \pagenumbering{Roman}
}

    
\uppertitleback{\theinstitute \\ \thefaculty \\ \iflanguage{ngerman}{Hochschule Karlsruhe}{Karlsruhe University of Applied Sciences}\\ \theinstituteaddress \\ \theinstitutecity }

\newcommand{\includetitle}{
    \maketitle
}

\newcommand{\includedeclaration}{}
\renewcommand{\includedeclaration}{\input{content/04-declaration}\blankpage}

\newcommand{\includepc}{}
\renewcommand{\includepc}{\input{content/05_pc}\blankpage}

\newcommand{\includeabstract}{}

  \newcommand{\theAbstract}{}
  \newcommand{\abstract}{}
  \newcommand{\Abstract}{}

  \renewcommand{\includeabstract}{
  \iflanguage{ngerman}{
    % include German and English abstracts
    \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
    \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}
    % \addcontentsline{toc}{chapter}{\abstractname}
    {\Large\changefont{phv}{b}{n}\centering{\thetitle}\\\vspace{0.7cm}} ##1}}
    \include{content/03-abstract-de}
    \theAbstract
    \vfill
    \textbf{Stichw\"orter:} \emph{\thekeywords}

    \begin{otherlanguage}{english}
      \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
      \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname}
    %   \addcontentsline{toc}{chapter}{\abstractname}
    {\Large\changefont{phv}{b}{n}\centering{\thetitleotherlanguage}\\\vspace{0.7cm}} ##1}}
      \include{content/02-abstract-en}
      \theAbstract
      \vfill % works also: %\vskip 0.7cm
      \textbf{Keywords:} \emph{\thekeywordsotherlanguge}
    \end{otherlanguage}
  }{
    % include English and German abstracts
    \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
    \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} {\Large\changefont{phv}{b}{n}\centering{\thetitle}\\\vspace{0.7cm}} ##1}}
    \include{content/02-abstract-en}
      \theAbstract
      \vfill
      \textbf{Keywords:} \emph{\thekeywords}
    \begin{otherlanguage}{ngerman}
      \renewcommand{\abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} ##1}}
      \renewcommand{\Abstract}[1]{\renewcommand{\theAbstract}{\chapter*{\abstractname} {\Large\changefont{phv}{b}{n}\centering{\thetitleotherlanguage}\\\vspace{0.7cm}} ##1}}
      \include{content/03-abstract-de}
      \theAbstract
      \vfill
      \textbf{Stichw\"orter:} \emph{\thekeywordsotherlanguge}
    \end{otherlanguage}
  }
  }

\newcommand{\includeacknowledgments}{}
  \renewcommand{\includeacknowledgments}{\newpage\vspace*{\fill}\begin{center}\emph{\input{content/01-acknowledgements}}\end{center}\vspace*{\fill}}

\newcommand{\inculdetableofcontents}{}
  \renewcommand{\inculdetableofcontents}{
    \tableofcontents
    \blankpage
  }

\newcommand{\nomenlcaturename}{\iflanguage{ngerman}{Nomenklatur}{Nomenclature}}
\newcommand{\acronymsname}{\iflanguage{ngerman}{Abkürzungsverzeichnis}{Acronyms}}
\renewcommand{\lstlistlistingname}{\iflanguage{ngerman}{Listingsverzeichnis}{Listings}}

\newcommand{\includeglossary}{}
\renewcommand{\includeglossary}{
    \glsaddall
    \printglossary[title=\glossaryname, toctitle=\glossaryname] % \addcontentsline{toc}{chapter}{\glossaryname}
}
\newcommand{\includeacronyms}{}
\renewcommand{\includeacronyms}{
    \glsaddall
    \printacronyms[title=\acronymsname, toctitle=\acronymsname] %\addcontentsline{toc}{chapter}{\acronymsname}
}

\newcommand{\includenomenclature}{}
\renewcommand{\includenomenclature}{
    \makenomenclature
    \printnomenclature[title=\nomenlcaturename, toctitle=\nomenlcaturename]
    % \addcontentsline{toc}{chapter}{\nomenlcaturename}
}
\newcommand{\inculdelistoffigures}{}
\renewcommand{\inculdelistoffigures}{
    \listoffigures \addcontentsline{toc}{chapter}{\listfigurename}
}
\newcommand{\inculdelistoftables}{}
\renewcommand{\inculdelistoftables}{
    \listoftables \addcontentsline{toc}{chapter}{\listtablename}
}
\newcommand{\inculdelistoflistings}{}
\renewcommand{\inculdelistoflistings}{
    \lstlistoflistings \addcontentsline{toc}{chapter}{\lstlistlistingname}
}

\newcommand{\setmainpart}{
  \cleardoubleplainpage
  \setcounter{page}{1}
  \pagenumbering{arabic}
}

\newcommand{\Appendix}[1][\appendixname]{\chapter*{#1}\addcontentsline{toc}{chapter}{#1} \appendix \setcounter{figure}{0}}

\newcommand{\Bibliography}[1]{\addcontentsline{toc}{chapter}{\bibname} \bibliography{#1}}

%% Use plainnat to work nicely with natbib.
\bibliographystyle{plainnat}

\newcommand{\addmybibentry}{}
  \renewcommand{\addmybibentry}{
    \newpage
    \section*{\iflanguage{ngerman}{BibTex Eintrag für dieser Arbeit}{BibTex Entry of this Thesis}}
    \ifiRASthesis@bachelor @bachelorsthesis \else @mastersthesis \fi\{\theauthor\_\theeditend, 	\\
	\tab author = \{\theauthor\},		\\
	\tab iRAS-thesis = \thesistype,		\\
	\tab keywords = \{\thekeywords\},		\\
	\tab location = \{Karlsruhe, Germany\},	\\
	\tab school = \{Karlsruhe University of Applied Sciences\},	\\
	\tab title = \{\thetitle\},			\\
	\tab year = \{\theeditend\}			\\
    \}
  }
\setlength{\footheight}{14.5pt}

  
% \renewcommand*{\chapterpagestyle}{\ofoot{}}

% \rehead{\pagemark}
% \rohead{\pagemark}
% \ofoot{}

% \renewcommand*{\sectionmark}[1]{%
%     \markright{\MakeMarkcase{\ifnumbered{section}{\sectionmarkformat}{}#1}}