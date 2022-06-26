\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Thesis}[2022/04/10 v1.0]

\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage{xcolor}

\RequirePackage{amsmath}
\RequirePackage{amsfonts,amssymb}
\RequirePackage{amsthm,amstext}
\RequirePackage{bm,upgreek}
%\RequirePackage{unicode-math}
%\setmathfont{NewCMMath-Regular.otf}
%\RequirePackage{newtxmath}  %% 设置数学字体
%\RequirePackage{newtxtext}  %% 设置数学字体
%\RequirePackage{txfonts}  %% 设置数学字体
%\RequirePackage{stix}  %% 设置数学字体
%\RequirePackage{mathtime}\DeclareMathVersion{bold}  %% 设置数学字体
%\RequirePackage[lite,subscriptcorrection,slantedGreek,nofontinfo]{mtpro2}  %% 设置数学字体
%\RequirePackage{millennial}  %% 设置数学字体
%\RequirePackage{mathpazo} %% 设置数学公式字体
\RequirePackage{array}

\definecolor{slcolor}{HTML}{882B21}

%%This parts handles the options passed to the class.
%\DeclareOption{onecolumn}{\OptionNotUsed}
%\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
%\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[UTF8,a4paper,twoside,onecolumn,zihao=-4,linespread=1.5]{ctexart}
\RequirePackage{fontspec,times}
\RequirePackage{ccfonts}
\RequirePackage[T1]{fontenc}
\RequirePackage{type1cm}
\setmainfont{Times New Roman}
\RequirePackage{ctex,CJK}
\newCJKfontfamily{\csonti}{FZCuSong-B09S}[BoldFont=FZCuSong-B09S]
\newCJKfontfamily{\Kaiti}{STKaiti}
%\setCJKmainfont{SimSun}
%\setCJKmonofont{SimSun}
%%%% 设置页面布局
\RequirePackage{geometry,fancyhdr}  
\geometry{left=2.5cm,right=2.0cm,top=2.5cm,bottom=2.0cm,headheight=2.17cm,footskip=1.2cm,heightrounded}
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markboth{{第\zhnum{section}章}{\quad} #1}{}}
%\fancyhf{}
\fancyhead[OC]{\fontsize{9pt}{13.5pt}\selectfont 南京工业大学本科生毕业设计（论文）}
\fancyhead[EC]{\fontsize{9pt}{13.5pt}\selectfont \leftmark}
\fancyhead[R]{}
\fancyhead[L]{}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

%%%% 设置图表属性
\RequirePackage{booktabs,caption}
\RequirePackage{longtable,makecell,multirow,float}
\extrafloats{50}
\belowrulesep =0pt
\captionsetup[table]{labelsep=quad,font=small}
\captionsetup[figure]{labelsep=quad,font=small}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
%%%% 设置中英文标题

\renewcommand{\title}[2]{\newcommand{\@cntitle}{#1} \newcommand{\@entitle}{#2}}
\newcommand{\makeentitle}{%
	\newpage
	\begin{center}
		\fontsize{14pt}{21pt}\bfseries\selectfont
		\headlinecolor
		\@entitle
	\end{center}
	}

\newcommand{\makecntitle}{%
	\newpage
	\begin{center}
		\fontsize{15pt}{22.5pt}%\fontfamily{phv}
		\csonti\bfseries
		%\fontshape{sl}
		\selectfont
		\headlinecolor
		\@cntitle
	\end{center}
}
%%%% 设置中英文摘要格式

\newenvironment{enabstract}{%
	\vspace{0pt}
	\begin{center}
		\zihao{4}
		\bfseries
		Abstract
	\end{center}
	\markboth{Abstract}{}
	\par
	}
	{%\vskip 2.5ex
	}

\newenvironment{cnabstract}{%
	\vspace{0pt}
	\begin{center}
		\zihao{-3}
		\csonti\bfseries
		摘要
	\end{center}
	\markboth{摘要}{}
	\par
	}
	{%\vskip 2.5ex
	}

%%%%  设置章节格式
% redefine the \section command to output a custom header
\RequirePackage{titlesec}
\RequirePackage{zhnumber}
\RequirePackage{ctex}
\setcounter{secnumdepth}{4}
%% 设置一级标题格式————三号宋体居中
\titleformat{\section}         % Customise the \section command   \scshape小型大写
	{\fontsize{16pt}{18.4pt}\songti\selectfont\centering\newpage} % Make the \section headers large (\Large),
% small capitals (\scshape) and left aligned (\raggedright)
	{
		{第\,\chinese{section}\,章}
%		{第\,\zhnum{section}\,章  \bfseries}
	}{0.7em}                      % Can be used to give a prefix to all sections, like 'Section ...'
	{		
	}
	[
		\setcounter{table}{0}
		\setcounter{figure}{0}
		\setcounter{equation}{0}
	]                          % Can be used to insert code before the heading
	%[\titlerule]                 % Inserts a horizontal line after the heading
	
%% 设置二级标题格式————四号宋体加粗居左
\titleformat{\subsection}
	{\fontsize{14pt}{16.1pt}\selectfont\scshape\raggedright\csonti\bfseries}
	{\arabic{section}.\arabic{subsection} \bfseries}{0.7em}
	{%\vspace{-8pt}
	} %front
	[%\vspace{-1pt}
	] %

	
%% 设置三级标题格式————小四号宋体居左
\titleformat{\subsubsection}
	{\fontsize{12pt}{13.8pt}\selectfont\raggedright}
	{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{0.7em}
	{\vspace{-10pt}
	}
	[%\vspace{-1pt}
	]
	
%% 设置四级标题格式————首行缩进两个字符，宋体小四号字
\titleformat{\paragraph}
	{\zihao{-4}\selectfont}
	{\setlength{\parindent}{2em}\indent\arabic{paragraph}.}{0.7em}
	{%\vspace{-15pt}
	}[]
	
%% 新建致谢环境
\newenvironment{zhixie}{%
	\par
	\begin{center}
		\zihao{3}
		\bfseries
		致谢
	\end{center}
	
	}{\vskip 2.5ex}

%%%%  制作封面

\RequirePackage{xeCJKfntef}
%\renewcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\newcommand{\cover}[7]{\newcommand{\@coveryear}{#1}
	%\newcommand{\@covertitle}{#2}
	\newcommand{\@covermajor}{#2}
	\newcommand{\@coverclass}{#3}
	\newcommand{\@covername}{#4}
	\newcommand{\@coverguider}{#5}
	\newcommand{\@coverdaterange}{#6}
	\newcommand{\@covermonth}{#7}	
}

\newcommand{\makecover}{
	\thispagestyle{empty}
	\par
	\vspace{40pt}
	\begin{figure}[htbp]
		\centering
		\includegraphics[width = 0.5\textwidth]{logo/njgydx_fonts}
	\end{figure}
	\vspace{42pt}
	\begin{center}
		\zihao{1}\Kaiti 
		\CJKunderline{\makebox[2.5cm]{\@coveryear}}届毕业设计(论文)
	\end{center}
	\vspace{88pt}
	\linespread{2.6}  % ???
	\begin{table}[htbp]
		%\renewcommand\arraystretch{1.6}
		\centering
		\setlength{\tabcolsep}{-2pt}
		\begin{tabular}{p{0.17\textwidth}<{\centering}p{0.39\textwidth}<{\centering}}
			{\zihao{3} \makebox[2.24cm]{题 \hfill 目}} & {\zihao{3}\selectfont \CJKunderline{:\hfill \@cntitle \hfill\ }} \\
			{\zihao{3} \makebox[2.24cm]{专 \hfill 业}} & {\zihao{3}\linespread{1.5} \CJKunderline{:\makebox[0.39\textwidth]{\@covermajor}}} \\ 
			{\zihao{3} \makebox[2.24cm]{班 \hfill 级}} & {\zihao{3}\linespread{1.5} \CJKunderline{:\makebox[0.39\textwidth]{\@coverclass}}} \\ 
			{\zihao{3} \makebox[2.24cm]{姓 \hfill 名}} & {\zihao{3}\linespread{1.5} \CJKunderline{:\makebox[0.39\textwidth]{\@covername}}} \\ 
			{\zihao{3} \makebox[2.24cm]{指 \hfill 导 \hfill 老 \hfill 师}} & {\zihao{3}\linespread{1.5} \CJKunderline{:\makebox[0.39\textwidth]{\@coverguider}}} \\ 
			{\zihao{3} \makebox[2.24cm]{起 \hfill 讫 \hfill 日 \hfill 期}}  & {\zihao{3}\linespread{1.5} \CJKunderline{:\makebox[0.39\textwidth]{\@coverdaterange}}} 
		\end{tabular}
	\end{table}
	\vspace{70pt}
	\begin{center}
		\zihao{3} 
		\@coveryear \quad 年 \quad \@covermonth \quad 月
	\end{center} %  ??
	\newpage
	}

%%%%  设置目录显示格式
\RequirePackage{titletoc}
\titlecontents{section}[4em]
	{\zihao{4}\linespread{1.5} \bfseries}
	{\contentslabel{4em}}
	{\hspace*{-4em}}
	{~\titlerule*[0.6pc]{$.$}~\contentspage}
\ctexset{
	section = {
		name = {第,章},
		number = \chinese{section},
			}
		}

%%%%  其他细节
%%  设置公式格式
\renewcommand{\theequation}{\thesection-\arabic{equation}}

%%%% 其他

\RequirePackage{gbt7714}
\RequirePackage{graphicx,subfigure}
\RequirePackage[hidelinks]{hyperref}
