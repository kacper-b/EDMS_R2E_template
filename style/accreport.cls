%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                              %
%  Class accreport.cls which loads cernyrep.cls                %
%  and then modifies abstract and pagestyles                   %
%                                                              %
%  v1.0 2013/10/16 Mathieu Baudin                              %
%                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{accreport}[2013/10/16 Mathieu Baudin]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{cernyrep}}

\ProcessOptions

\LoadClassWithOptions{cernyrep}

%%% PAGE LAYOUT
\RequirePackage[top=2cm, bottom=2cm, left=2.5cm, right=2.5cm]{geometry}
%\setlength{\headheight}{50pt}
\setlength{\headwidth}{16cm}
\setlength{\textwidth}{16cm}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
% Definition of headings for title page and other pages  %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%the proper date format is needed in header:
\RequirePackage{datetime}
\ddmmyyyydate
\renewcommand{\dateseparator}{-}

\RequirePackage{fancyhdr}
\fancyhf{}
\renewcommand\headrulewidth{0pt}
\fancyhead[R]{{\bf CERN-ACC-\the\year-\docnumber}}
\fancyhead[L]{Report}
\fancyfoot[C]{\thepage}
\renewcommand\headrulewidth{0pt}

\fancypagestyle{plain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
}
\pagestyle{fancy}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                           %
% Defining a new 'abstract' environment flushed to the left %
% and defining a 'keywords environment'' as well            %  
%                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{RepAbstract}{%
\begin{flushleft}% 
	\bfseries \abstractname
\end{flushleft}
}

\newcommand{\keywords}{{\bf Keywords:}}
\newenvironment{Keywords}{%
\flushleft \keywords
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                           %
% Making the references appear in the Table of Contents:    %
% by inserting the bibliography heading as a section name.  %
%                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\bibname}{\section{References}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                           %
% Renew the maketitle command sequence                      %
%                                                           %                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@maketitle{
								\hspace{-\parindent}\parbox{11cm}{\includegraphics[height=1.5cm, keepaspectratio=true]{./Figures/CERN_Logo}}
								\parbox{5cm}{\begin{flushright}{\bf CERN-ACC-\the\year-\docnumber}\\ \today \\ \emailaddress \\ \end{flushright}}
								\vspace{1.0cm}\par										
								\begin{center}
										\baselineskip1.2\baselineskip\LARGE\bfseries Report\par
										\vspace{0.5cm} \par
                    \baselineskip1.2\baselineskip\Large\bfseries \@title\par
										\vspace{1.5cm} \par
                \end{center}
                \mbox{}\\[-11mm]
                \begin{flushleft}
                    {\normalsize\itshape\@author}\\ 
                    {\normalsize\rmfamily\@institute}
                \end{flushleft}
                \thispagestyle{plain}
               }

\endinput
