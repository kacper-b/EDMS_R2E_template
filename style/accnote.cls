%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                              %
%  Class accnote.cls which loads cernyrep.cls                  %
%  and then modifies abstract and pagestyles                   %
%                                                              %
%  v1.0 2013/10/16 Mathieu Baudin                              %
%                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{accnote}[2013/10/16 Mathieu Baudin]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{cernyrep}}

\ProcessOptions

\LoadClassWithOptions{style/cernyrep}

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
\fancyhead[R]{{\bf EDMS-\edmsnumber, rev. \revnumber}}
\fancyhead[L]{EDMS document}
\fancyfoot[C]{\thepage}
\renewcommand\headrulewidth{0pt}

\fancypagestyle{plain}{
	\fancyhf{}
	\cfoot{{\small{\it This is an internal CERN publication and does not necessarily reflect the views of the CERN management.}}}
	\renewcommand{\headrulewidth}{0pt}
}
\pagestyle{fancy}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                           %
% Defining a new 'abstract' environment flushed to the left %
% and a 'keywords' environment                              %
%                                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{NoteAbstract}{%
	\begin{flushleft}%
	\par\vspace{1cm}\par
	\hspace{-\parindent}\hrulefill{}\par
	\par\vspace{-0.5cm}\par
	\hspace{-\parindent}\hrulefill{}\par
	\bfseries \abstractname \par
	\end{flushleft}
	}

\newcommand{\keywords}{{\bf Keywords:}}
\newenvironment{Keywords}{%
	\flushleft \keywords
}
{\par\hspace{-\parindent}\hrulefill{}\par}

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
								\hspace{-\parindent}\parbox{11cm}{\includegraphics[height=1.5cm, keepaspectratio=true]{./Figures/CERN_R2E_logo}}
								\parbox{5.05cm}{\begin{flushright}{{\bf EDMS-\edmsnumber, rev. \revnumber}}\\ \today \\ \emailaddress \\ \end{flushright}}
								\vspace{1.0cm}\par										
								\begin{flushleft}
								    \baselineskip1.2\baselineskip\Large\bfseries \@title\par
										\vspace{1.0cm}
                \end{flushleft}
								
                \mbox{}\\[-11mm]
                \begin{flushleft}
                    {\normalsize\itshape\@author}\\ 
                    {\normalsize\rmfamily\@institute}
                \end{flushleft}
                \thispagestyle{plain}
               }
							
							
\endinput
