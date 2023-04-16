\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Thesis}[2023/02/27 v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
% 继承父类格式
\LoadClass[UTF8,a4paper,twoside,onecolumn,zihao=-4,linespread=1.5]{ctexart}

% 学位类型
\newcommand{\degreeType}[2]{
	\newcommand{\@cndegreename}{#1}
	\newcommand{\@endegreename}{#2}
}

% 公用宏包
%%  图片宏包
\RequirePackage{graphicx,subfigure}
%%  表格需要宏包
\RequirePackage{array} %% 表格单元格长度
\RequirePackage{longtable}
\RequirePackage{makecell}
\RequirePackage{float}
\RequirePackage{multirow}
\RequirePackage{booktabs} %%  控制线宽
\RequirePackage{tabularx} %%  自动计算宽度
%%  数学宏包
\RequirePackage{pifont} %% 提供带圈的数字
\RequirePackage{amsmath}
\RequirePackage{mathptmx}
\RequirePackage{amsfonts,amssymb}
\RequirePackage{amsthm,amstext}
\RequirePackage{bm}  %%   公式中字母加粗
\RequirePackage{upgreek} %%  大写希腊字母
%%  
%\RequirePackage{CJK}
%\RequirePackage{pgf}

%%  其他
%\RequirePackage{xcolor}  %%  颜色包
\RequirePackage{gbt7714}  %%  应用文献的格式包
\RequirePackage{listings}
\RequirePackage{calc}  %%  提供计算包，提供\minof{}{} \widthof{}函数
\RequirePackage{lastpage} %%  获取页码数
\RequirePackage{xparse}
\RequirePackage{ifthen}
\RequirePackage[hidelinks]{hyperref}  %% 超链接
\RequirePackage{microtype} %% 改善单词、字母的间距

% 设置字体
%%  设置默认英文字体为Times New Roman
\RequirePackage{times}
\setmainfont{Times New Roman}
%%  设置Arial字体
\newfontfamily{\arial}[AutoFakeBold=2.7]{Arial}[BoldFont = Arial 粗体]
%%  新建所需中文字体
\RequirePackage{fontspec}
\RequirePackage{ctex,CJK}
\newCJKfontfamily{\kaiti}{KaiTi}
\newCJKfontfamily{\huawenxingkai}{STXingkai}
%%%   重新设置黑体（含加粗）
\let\heiti\relax
\newCJKfontfamily{\heiti}[AutoFakeBold=2.7]{SimHei}
%%%   重新设置宋体(可加粗)
\setCJKmainfont[AutoFakeBold=true]{SimSun}
%\let\songti\relax
%\newCJKfontfamily{\sonti}[AutoFakeBold=2.7]{SimSun}
%\setCJKmainfont{SimSun}[BoldFont = FZCuSong-B09S]

% 设置页面布局

%%  页面大小
\RequirePackage{geometry}  
\geometry{left=3.17cm,right=3.17cm,top=2.54cm,bottom=2.54cm,headheight=1.5cm,footskip=1.75cm}
%%  页面样式 ，页眉页脚
\RequirePackage{fancyhdr}  
\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markboth{{\thesection}{\ } #1}{}}
%\fancyhf{}
\fancyhead[OC]{\zihao{-5}\linespread{1}\selectfont \leftmark}
\fancyhead[EC]{\zihao{-5}\linespread{1}\selectfont \@cndegreename 学位论文}
\fancyhead[R]{}
\fancyhead[L]{}
\fancyfoot[C]{\fontsize{9pt}{13.5pt}\selectfont \textbf{\thepage}} 
\setlength\headwidth{\textwidth}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}

% 重新定义格式

%%   参考文献标题格式
\renewcommand{\refname}{\hspace*{\fill}参考文献\hspace*{\fill}\vspace{6pt}}

%%  代码块格式
\lstset{
	%backgroundcolor = \color{yellow!10},    % 背景色：淡黄
	basicstyle = \small\ttfamily,           % 基本样式 + 小号字体
	%rulesepcolor= \color{gray},             % 代码块边框颜色
	breaklines = true,                  % 代码过长则换行
	%numbers = left,                     % 行号在左侧显示
	%numberstyle = \small,               % 行号字体
	%keywordstyle = \color{blue},            % 关键字颜色
	%commentstyle =\color{green!100},        % 注释颜色
	%stringstyle = \color{red!100},          % 字符串颜色
	%frame = shadowbox,                  % 用（带影子效果）方框框住代码块
	showspaces = false,                 % 不显示空格
	columns = fixed,                    % 字间距固定
	%escapeinside={<@}{@>} ,          % 特殊自定分隔符：<@可以自己加颜色@>
	morekeywords = {as},                % 自加新的关键字（必须前后都是空格）
	deletendkeywords = {compile}        % 删除内定关键字；删除错误标记的关键字用deletekeywords删！
}

%%  脚注

%% \RequirePackage{xunicode-addon}  %%能够显示 Unicode 所分配的带圈数字（和字母等
\RequirePackage[perpage,symbol*]{footmisc}
\RequirePackage{xpatch}
% cancel the superscript style of counter used in footnote text
\xpatchcmd\@makefntext
{{\hss\@makefnmark}}
{{\hss\@makefnmark@nosuperscript}\space}
{}{\fail}
\def\@makefnmark@nosuperscript{\lower -.0ex\hbox{\normalfont\@thefnmark}}

\DefineFNsymbols{circled}{{\ding{172}}{\ding{173}}{\ding{174}}
	{\ding{175}}{\ding{176}}{\ding{177}}{\ding{178}}{\ding{179}}{\ding{180}}{\ding{181}}}
\setfnsymbol{circled}
% \renewcommand\thefootnote{\textcircled{\@arabic{\c@footnote}}}

\renewcommand{\footnotesize}{\zihao{-5}\linespread{1}\selectfont}  %%  设置脚注字体大小


%%  公式编号格式

\renewcommand{\theequation}{\thesection-\arabic{equation}}

%%  章节格式
\RequirePackage{titlesec}
%\RequirePackage{biblatex}
\setcounter{secnumdepth}{4}  %%  章节编号深度
%% 设置一级标题格式————中文黑体，数字Times New Roman，小二加粗，单倍行距，段前6磅，段后0磅；两端对齐，大纲1级，编号与标题之间留一个空格
\titleformat{\section}   % Customise the \section command   \scshape小型大写
{	
	\linespread{1}
	\setlength{\parskip}{6pt}
	\zihao{-2}\heiti\bfseries\selectfont\raggedright
} % Make the \section headers large (\Large),
% small capitals (\scshape) and left aligned (\raggedright)
{
	{\thesection}
	%		{第\,\zhnum{section}\,章  \bfseries}
}{0.2em}                      % Can be used to give a prefix to all sections, like 'Section ...'
{		
}
[
\setcounter{table}{0}
\setcounter{figure}{0}
\setcounter{equation}{0}
]                          % Can be used to insert code before the heading
%[\titlerule]                 % Inserts a horizontal line after the heading

\titlespacing{\section}{0pt}{6pt}{0pt}

\newcommand{\bisection}[2]{
	\newpage
	\restoregeometry
	
	\section{#1}
	
	{	
		\linespread{1}
		\setlength{\parskip}{6pt}
		\zihao{-2}\bfseries\selectfont\raggedright
		{{\hspace{4.3pt}}\thesection{\hspace{0.2em}} #2 }
	}
	
	\addengcontents{section}{#2}
	
}


%%  二级标题：中文黑体，数字英文Times New Roman，小三号，行距固定值20磅，段前6磅，段后6磅；两端对齐，大纲2级，编号与标题之间留一个空格

\titleformat{\subsection}[runin]
{
	\setlength{\baselineskip}{20pt}
	\zihao{-3}\heiti\selectfont
	\raggedright
}
{
	\arabic{section}.\arabic{subsection}
}{0.2em}
{%\vspace{-8pt}
} %front
[%\vspace{-1pt}
] %

\titlespacing{\subsection}{0.5pt}{6pt}{6pt}

\newcommand{\bisubsection}[2]{
	
	\subsection{#1} 
	
	{
		\hspace{-12pt}
		\setlength{\baselineskip}{20pt}
		\zihao{-3}\selectfont
		（#2）
	}
	
	\addengcontents{subsection}{#2}
	
}

%% 中文黑体，数字Times New Roman，四号，行距固定值20磅，段前6磅，段后6磅；两端对齐，大纲3级，编号与标题之间留一个空格；三级标题不需要翻译成英文
\titleformat{\subsubsection}
{
	\setlength{\baselineskip}{20pt}
	\zihao{4}\heiti\selectfont\raggedright
}
{
	%\hspace{-1.5pt}
	\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}{0.2em}
{
	%\vspace{-10pt}
}
[%\vspace{-1pt}
]
\titlespacing{\subsubsection}{0pt}{6pt}{6pt}

%% \paragraph定义，学校给的模板没有要求

\titleformat{\paragraph}
{
	\setlength{\baselineskip}{20pt}
	\zihao{-4}
}
{
	\hspace{15pt}
	\arabic{paragraph}
}{0.2em}
{
	%\vspace{-10pt}
}
[%\vspace{-1pt}
]
\titlespacing{\paragraph}{0pt}{0pt}{0pt}

%%  设置行间距以及段间距
\RequirePackage{setspace}
\setlength{\parskip}{0pt}
%%%  参考文献间距20pt
\setlength{\bibsep}{0pt}

%% 设置图表格式
\RequirePackage[justification=centering]{caption}
\RequirePackage{bicaption}
\renewcommand{\tabularxcolumn}[1]{m{#1}<{\centering}} %更改X列格式
\extrafloats{50}  %%  允许浮动类型数量
\captionsetup[figure][bi-second]{name=Figure}  %%%  设置英文标题的前缀
\captionsetup[table][bi-second]{name=Figure}
\captionsetup{labelsep=space,font = small}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}

%%%  设置表格线颜色
\RequirePackage{booktabs,colortbl}
\definecolor{tablinecolor}{rgb}{.105,.410,.113}


%%%  子图
\vspace{-0.35cm} %大图与上面正文的距离
% \setlength{\abovecaptionskip}{-2pt} %大图与下面label的距离
\subfigtopskip=2pt %设置子图与上面正文或别的内容的距离
\subfigbottomskip=2pt %两行子图的间距
\subfigcapskip=-5pt %子图和自己的label之间的距离


% 设置prepages界面
\RequirePackage{xeCJKfntef} %%  划横线 \CJKunderline
\renewcommand{\title}[2]{
	\newcommand{\@cntitle}{#1}
	\newcommand{\@entitle}{#2}
}

\newcommand{\infor}[7]{
	\renewcommand{\@author}{#1}
	\newcommand{\@instructor}{#2}
	\newcommand{\@TTPP}{#3} % 职称
	\newcommand{\@degree}{#4}
	\newcommand{\@institution}{#5}
	\newcommand{\@major}{#6}
	\newcommand{\@research}{#7}
}

\newcommand{\Time}[4]{
	\newcommand{\@year}{#1}
	\newcommand{\@month}{#2}
	\newcommand{\@Year}{#3}
	\newcommand{\@Month}{#4}
}

\newcommand{\prepages}{
	\thispagestyle{empty}
	\begin{figure}[htbp]
		\includegraphics[width = 0.38\textwidth]{logo/zgkydx_logo}
	\end{figure}
	
	\begin{center}
		{\zihao{-2} \@cndegreename 学位论文}
	\end{center}
	
	\vspace{31.5pt}
	
	{\heiti\zihao{2} \centering \@cntitle %
		
	} \par
	
	\vskip -8pt
	
	{\centering\zihao{2}\centering \@entitle %
		
	}
	
	
	\vspace{80pt}
	
	\begin{table}[htbp]
		\renewcommand\arraystretch{1.5}
		\centering
		\setlength{\tabcolsep}{-2pt}
		\begin{tabular}{p{0.45\textwidth}<{\raggedleft}p{0.45\textwidth}}
			{\zihao{-3} \makebox[2.24cm]{作 \hfill 者：}} & {\zihao{-3}\selectfont \@author} \\
			{\zihao{-3} \makebox[2.24cm]{导 \hfill 师：}} & {\zihao{-3} \@instructor \hspace{0.6em} \@TTPP} \\ 
		\end{tabular}
	\end{table}
	
	\vspace{76pt}
	
	\begin{center}
		{\kaiti\selectfont \zihao{-2} 中国矿业大学 \par \vspace{18pt} \@year \; 年 \; \@month \; 月 }
	\end{center}
	
	\newpage
	
	\thispagestyle{empty}
	{\zihao{-2} \;}\par 
	\vspace{28pt}
	
	\vspace{6pt}
	{\centering\heiti\zihao{-2}\linespread{1}\bfseries\selectfont \textbf{学位论文使用授权声明}
		
	}
	\vspace{5pt}
	{\kaiti\selectfont 
		\setlength{\baselineskip}{20pt}   %%  固定行间距20磅
		本人完全了解中国矿业大学有关保留、使用学位论文的规定，同意本人所撰写的学位论文的使用授权按照学校的管理规定处理：\par
		作为申请学位的条件之一，学位论文著作权拥有者须授权所在学校拥有学位论文的部分使用权，即：\ding{172}学校档案馆和图书馆有权保留学位论文的纸质版和电子版，可以使用影印、缩印或扫描等复制手段保存和汇编学位论文；\ding{173}为教学和科研目的，学校档案馆和图书馆可以将公开的学位论文作为资料在档案馆、图书馆等场所或在校园网上供校内师生阅读、浏览。另外，根据有关法规，同意中国国家图书馆保存研究生学位论文。\par
		（保密的学位论文在解密后适用本授权书）。\par 
		
	}
	\vspace{36pt}
	作者签名：{\qquad \qquad \qquad \qquad \qquad \qquad \qquad \quad} 导师签名： \par 
	{\qquad \;}年 \qquad 月 \qquad 日 {\qquad \qquad \qquad \qquad \qquad \qquad \quad }年 \qquad 月 \qquad 日 
	
	\newpage
	
	\thispagestyle{empty}
	
	\newgeometry{left=2.0cm,right=2.0cm,top=2.74cm,bottom = 2.63cm}
	\begin{center}
		\begin{tabularx}{16.83cm}{|X|}
			\hline
			\parbox[c][2.2cm][c]{16.83cm}{
				\renewcommand\arraystretch{1.3}
				\hspace{-0.35cm}
				\begin{tabularx}{16.83cm}{XX}
					{中图分类号}\CJKunderline{\makebox[3.8cm]{}} & \makebox[2cm]{学 \hfill 校 \hfill 代 \hfill 码}\CJKunderline{\makebox[4cm]{\centering 10290 }} \\
					{\hspace{0.3cm}}UDC\CJKunderline{\makebox[4.8cm]{}} & \makebox[2cm]{密 \hfill 级}\CJKunderline{\makebox[4cm]{\centering 公开 }} \\
				\end{tabularx}
			} \\
			
			\parbox[c][6cm][c]{16.83cm}{
				\hspace{-0.35cm}
				\begin{tabularx}{16.83cm}{X}
					{\centering\huawenxingkai\zihao{1}\selectfont 中国矿业大学 
						
					}\\
					{\centering\lishu\zihao{1}\selectfont \@cndegreename 学位论文
						
					}\\
				\end{tabularx}
			}\\
			
			\parbox[c][5cm][c]{16.83cm}{
				\hspace{-0.35cm}
				\begin{tabularx}{16.83cm}{X}
					{\heiti\zihao{2} \centering \@cntitle %
						
					} \\
					
					\vspace{-6pt}
					{\centering\linespread{1.3}\zihao{2}\centering \@entitle %
						
					}\\
				\end{tabularx}
			}\\
			
			\parbox[c][7cm][c]{16.83cm}{
				\heiti\zihao{4}
				\renewcommand\arraystretch{1.3}
				\hspace{-0.35cm}
				\begin{tabularx}{16.83cm}{XX}
					\makebox[2cm]{作 \hfill 者}\CJKunderline{\makebox[5cm]{\resizebox{\minof{4.8cm}{\widthof{\@author}}}{!}{\centering \@author}}}  & \makebox[2cm]{导 \hfill 师} \CJKunderline{\makebox[5cm]{\resizebox{\minof{4.8cm}{\widthof{\@instructor}}}{!}{\centering \@instructor }}} \\
					\makebox[2cm]{申 \hfill 请 \hfill 学 \hfill 位}\CJKunderline{\makebox[5cm]{\resizebox{\minof{4.8cm}{\widthof{\@degree}}}{!}{\centering \@degree}}}  & \makebox[2cm]{培 \hfill 养 \hfill 单 \hfill 位} \CJKunderline{\makebox[5cm]{\resizebox{\minof{4.8cm}{\widthof{\@institution}}}{!}{\centering \@institution }}} \\
					\makebox[2cm]{学 \hfill 科 \hfill 专 \hfill 业}\CJKunderline{\makebox[5cm]{\resizebox{\minof{4.8cm}{\widthof{\@major}}}{!}{\centering \@major}}}  & \makebox[2cm]{研 \hfill 究 \hfill 方 \hfill 向} \CJKunderline{\makebox[5cm]{\resizebox{\minof{4.8cm}{\widthof{\@research}}}{!}{\centering \@research }}} \\
					\makebox[3.4cm]{答辩委员会主席}\CJKunderline{\makebox[3.6cm]{\centering}}  & \makebox[2cm]{评 \hfill 阅 \hfill 人} \CJKunderline{\makebox[5cm]{\centering  }}\\
				\end{tabularx}
			}\\
			
			\parbox[c][2.5cm][c]{16.83cm}{
				{\centering
					\heiti\zihao{4}\selectfont
					\@Year \ 年 \ \@Month \ 月
					
				}
			}\\
			\vskip 10pt
			{\;  }\\
			\hline
		\end{tabularx}
	\end{center}
	\clearpage
	\restoregeometry
}
% \begin{table}[htbp]
	% 	\centering
	% 	\renewcommand\arraystretch{1.3}
	% 	\begin{tabular}{|p{\textwidth}|}
		% 		\hline
		% 		{\centering \zihao{4} 
			% 		{\quad}{中图分类号}\CJKunderline{\makebox[3.8cm]{}}  {\qquad \qquad } \makebox[2cm]{学 \hfill 校 \hfill 代 \hfill 码}\CJKunderline{\makebox[4cm]{\centering 10290 }} 
			% 		}\\
		% 		{\centering \zihao{4} 
			% 		{\quad}UDC\CJKunderline{\makebox[5.3cm]{}}  {\qquad \qquad } \makebox[2cm]{密 \hfill 级}\CJKunderline{\makebox[4cm]{\centering 公开 }} 
			% 		}\\
		% 		\vspace{20pt}
		% 		{\centering\huawenxingkai\zihao{1}\selectfont 中国矿业大学 
			
			% 		} \\
		% 		\vspace{-24pt}
		% 		{\centering\lishu\zihao{1}\selectfont \@cndegreename 学位论文
			
			% 		}\\
		% 		\vspace{8pt}
		
		% 		{\heiti\zihao{2} \centering \@cntitle %
			
			% 		} \par
		% 		\vspace{-6pt}
		% 		{\centering\linespread{1.3}\zihao{2}\centering \@entitle %
			
			% 		}\\
		% 		\vspace{52pt}
		% 		{\centering \heiti\zihao{4} 
			% 			{\qquad}\makebox[2cm]{作 \hfill 者}\CJKunderline{\makebox[4cm]{\centering \@author}}  {\qquad \quad } \makebox[2cm]{导 \hfill 师} \CJKunderline{\makebox[4.2cm]{\centering \@instructor }} 
			% 		}\\
		% 		{\centering \heiti\zihao{4} 
			% 			{\qquad}\makebox[2cm]{申 \hfill 请 \hfill 学 \hfill 位}\CJKunderline{\makebox[4cm]{\centering \@degree}}  {\qquad \quad } \makebox[2cm]{培 \hfill 养 \hfill 单 \hfill 位} \CJKunderline{\makebox[4.2cm]{\centering \@institution }} 
			% 		}\\
		% 		{\centering \heiti\zihao{4} 
			% 			{\qquad}\makebox[2cm]{学 \hfill 科 \hfill 专 \hfill 业}\CJKunderline{\makebox[4cm]{\centering \@major}}  {\qquad \quad } \makebox[2cm]{研 \hfill 究 \hfill 方 \hfill 向} \CJKunderline{\makebox[4.2cm]{\centering \@research }} 
			% 		}\\
		% 		{\centering \heiti\zihao{4} 
			% 			{\qquad}\makebox[3.4cm]{答辩委员会主席}\CJKunderline{\makebox[2.6cm]{\centering}}  {\qquad \quad } \makebox[2cm]{评 \hfill 阅 \hfill 人} \CJKunderline{\makebox[4.2cm]{\centering  }} 
			% 		}\\
		% 		\vspace{68pt}
		% 		{\centering
			% 			\heiti\zihao{4}\selectfont
			% 			 \@Year \ 年 \ \@Month \ 月
			
			% 		}\\
		
		% 		{\;  }
		% 		\\
		% 		\hline
		% 	\end{tabular}
	% \end{table}
% \clearpage

% 定义新环境
%%  致谢环境
\newenvironment{thank}{%
	\newpage
	\pagestyle{empty}
	\begin{center}
		\zihao{-2}
		\bfseries
		\heiti\selectfont
		\linespread{1}
		\textbf{致谢}
	\end{center}
	\par
	\vspace{-3pt}
	\kaiti\zihao{-4}\selectfont\setlength{\baselineskip}{20pt}
}
{%\vskip 2.5ex	
	\newpage
}

%%  中英文摘要
\newenvironment{enabstract}{%
	\newpage
	\pagestyle{plain}  %% 只在该组中生效
	\markboth{Abstract}{}
	\phantomsection
	\addcontentsline{toe}{section}{Abstract}
	\vspace{0pt}
	\begin{center}
		\zihao{-2}
		\linespread{1}
		\arial
		\textbf{
			Abstract
		}
	\end{center}
	\par
	
	\sloppy
	\zihao{-4}\setlength{\baselineskip}{20pt}
}
{%\vskip 2.5ex
	\newpage
}

\newenvironment{cnabstract}{%
	\newpage
	\pagestyle{plain}
	\markboth{摘要}{}
	\phantomsection
	\addcontentsline{toc}{section}{摘要}
	\vspace{6pt}
	\begin{center}
		\linespread{1}
		\zihao{-2}
		\bfseries
		\heiti
		摘\ \ 要
	\end{center}
	\par
	
	\sloppy
	\zihao{-4}\setlength{\baselineskip}{20pt}
}
{%\vskip 2.5ex
	\newpage
}

%%  变量注释表环境
\newenvironment{varitable}{%
	% \newpage
	% \pagestyle{plain}
	%\newgeometry{left=2.98cm,right=2.98cm,top=2.74cm,bottom = 2.63cm}
	\markboth{变量注释表}{}
	\phantomsection
	\addcontentsline{toc}{section}{变量注释表}
	\addcontentsline{toe}{section}{List of Variables}
	\vspace{6pt}
	\begin{center}
		\linespread{1}
		\zihao{-2}
		\bfseries
		\heiti
		变量注释表
	\end{center}
	\vspace{-10pt}
	
	\zihao{5}
	\begin{longtable}{@{}|p{\linewidth-10.68cm-4\tabcolsep-3\arrayrulewidth}|p{10.68cm}|@{}}
		\hline
	}
	{%\vskip 2.5ex
		\hline
	\end{longtable}
	\newpage
	%\restoregeometry
}

%  目录
\RequirePackage{xparse}
\RequirePackage{babel}
\RequirePackage{titletoc}

%%  中英文目录

\titlecontents{section}[0.2em]
{\zihao{-4}\linespread{1} \bfseries}
{\contentslabel{0em} \hspace{8pt}}
{\hspace*{0em}}
{~\titlerule*[0.6pc]{$.$}~\contentspage\hspace*{0.2em}}
[\vskip 6pt]

\titlecontents{subsection}[0.2em]
{\zihao{-4}\setlength{\baselineskip}{20pt} }
{\contentslabel{0em} \hspace{16pt}}
{\hspace*{0em}}
{~\titlerule*[0.6pc]{$.$}~\contentspage\hspace*{0.2em}}
[\vskip 6pt]

%%%  英文目录
\newcommand\engcontentsname{Contents}

\newcommand\tableofengcontents{%
	
	\newpage
	
	\phantomsection
	\addcontentsline{toe}{section}{Contents}
	
	\pagestyle{plain}
	
	\if@twocolumn
	\@restonecoltrue\onecolumn
	\else
	\@restonecolfalse
	\fi
	
	{\centering\MakeUppercase\arial\zihao{-2}\bfseries\selectfont
		\engcontentsname
		
	}
	
	\vspace{18pt}
	%\chapter*{\engcontentsname
		\@mkboth{%
			\MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}
		%}%
	\@starttoc{toe}% !!!!Define a new contents!!!!
	\if@restonecol\twocolumn\fi
}
\newcommand\addengcontents[2]{%
	\addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}} %the#1是thesection或者thesubsection

%%%  中文目录
\setcounter{tocdepth}{2}  %%  目录显示深度
\renewcommand{\contentsname}{\vspace{6pt}\hspace*{\fill}{\zihao{-2}\bfseries\selectfont\linespread{1}目\quad 录}\hspace*{\fill}\vspace{6pt}} 

%%  图表列表

\renewcommand{\listfigurename}{
	{\vspace{6pt}\heiti\zihao{-2}\bfseries\selectfont\centering\linespread{1}
		图清单
		
}}
\renewcommand{\listtablename}{
	{\vspace{6pt}\heiti\zihao{-2}\bfseries\selectfont\centering\linespread{1}
		表清单
		
}}

%%%  图清单

\ExplSyntaxOn %启用latex3语法

\tl_new:N \g_listoffigures_storelines_tl  %% 创建一个token list变量，全局变量在listoffigures模块中用来storelines，类型为tl

\newif\ifenfigcaption\enfigcaptiontrue %

%\hyper@linkstart{link}{\Hy@tocdestname}{#2}\hyper@linkend

\DeclareDocumentCommand \mycontentsline{ m m m m }
{
	\ifthenelse{\equal{#1}{figure}}
	{
		#2
		
		\tl_gput_right:Nx \g_listoffigures_storelines_tl
		{
			
			\exp_not:V {\l_tmpa_tl} \exp_not:N &
			
			\exp_not:V {\l_tmpb_tl} \exp_not:N &
			
			\exp_not:n { #3 \\ \hline }
			
		}
	}{
	}
}

\DeclareDocumentCommand \mynumberline { m m }  %%  m表示必选参数
{
	%%  临时token list 变量(局部变量)
	\ifenfigcaption
	
	\tl_set:Nn \l_tmpa_tl {图~#1}
	
	\enfigcaptionfalse
	
	\else
	
	\tl_set:Nn \l_tmpa_tl {Figure~#1}
	\enfigcaptiontrue
	
	\fi
	
	\tl_set:Nn \l_tmpb_tl { #2 }
	
}  


% \DeclareDocumentCommand \mylatfigure { m m }
% {   
	%     #1
	
	% 	\tl_gput_right:Nx \g_listoffigures_storelines_tl
	% 	{
		
		% 		\exp_not:V \l_tmpa_tl \exp_not:N &
		
		% 		\exp_not:V \l_tmpb_tl \exp_not:N &
		
		% 		\exp_not:n { #2 \\ \hline }
		
		% 	}
	% }

\DeclareDocumentCommand \UseEntries {}
{
	\tl_use:N  \g_listoffigures_storelines_tl  	
}


\ExplSyntaxOff


\newcolumntype{C}[1]{>{\centering\arraybackslash}m{\dimexpr #1 \relax}}

\renewcommand\listoffigures{%
	
	\newpage
	
	\newgeometry{left=2.98cm,right=2.98cm,top=2.74cm,bottom = 2.63cm}
	
	\phantomsection
	\addcontentsline{toc}{section}{图清单}
	\addcontentsline{toe}{section}{List of Figures}
	
	\pagestyle{plain}
	
	\if@twocolumn
	
	\@restonecoltrue\onecolumn
	
	\else
	
	\@restonecolfalse
	
	\fi
	
	%\section*{\listfigurename}%
	
	{\MakeUppercase\listfigurename}
	
	\@mkboth{\MakeUppercase\listfigurename}%
	{\MakeUppercase\listfigurename}%
	
	\begingroup
	
	%\let\l@figure\mylatfigure
	
	\let\contentsline\mycontentsline
	
	\let\numberline\mynumberline
	
	\let\addvspace\@gobble
	
	\@starttoc{lof}%
	
	\zihao{5}
	
	\vspace{0pt} %
	
	\begin{longtable}{@{}|C{2.5cm}|C{\linewidth-5cm}|C{2.5cm-6\tabcolsep-4\arrayrulewidth}|@{}}
		\hline
		
		图序号 & 图名称 & 页码 \\ \hline \endhead
		
		\UseEntries
		
	\end{longtable}
	%  
	
	\endgroup
	
	\if@restonecol\twocolumn\fi
	
	\setcounter{table}{0}
	
	%\clearpage
	
}


%%%  表清单
\ExplSyntaxOn

\tl_new:N \g_listoftables_storelines_tl

\newif\ifentabcaption\entabcaptiontrue %


\DeclareDocumentCommand \tabcontentsline{ m m m m }
{
	
	\ifthenelse{\equal{#1}{table}}
	{
		#2
		
		\tl_gput_right:Nx \g_listoftables_storelines_tl
		
		{
			
			\exp_not:V \l_tmpa_tl \exp_not:N &
			
			\exp_not:V \l_tmpb_tl \exp_not:N &
			
			\exp_not:n { #3 \\ \hline }
			
		}
	}{
		
	}
}


\DeclareDocumentCommand \tabnumberline { m m }

{
	
	\ifentabcaption
	
	\tl_set:Nn \l_tmpa_tl {表~#1}
	\entabcaptionfalse
	
	\else
	
	\tl_set:Nn \l_tmpa_tl {Table~#1}
	\entabcaptiontrue
	
	\fi
	
	\tl_set:Nn \l_tmpb_tl {#2}
	
}  

% \DeclareDocumentCommand \mylattable { m m }

% {
	
	% 	#1
	
	% 	\tl_gput_right:Nx \g_listoftables_storelines_tl
	
	% 	{
		
		% 		\exp_not:V \l_tmpa_tl \exp_not:N &
		
		% 		\exp_not:V \l_tmpb_tl \exp_not:N &
		
		% 		\exp_not:n { #2 \\ \hline }
		
		% 	}
	
	% }

\DeclareDocumentCommand \UsetabEntries {}

{
	
	\tl_use:N  \g_listoftables_storelines_tl
	
}
\ExplSyntaxOff

\renewcommand\listoftables{%
	
	\phantomsection
	\addcontentsline{toc}{section}{表清单}
	\addcontentsline{toe}{section}{List of Tables}
	
	\pagestyle{plain}
	
	\if@twocolumn
	
	\@restonecoltrue\onecolumn
	
	\else
	
	\@restonecolfalse
	
	\fi
	
	% \chapter*{\listfigurename}%
	
	%\@mkboth{\MakeUppercase\listtablename}
	
	{\MakeUppercase\listtablename}%
	
	\begingroup
	
	%\let\l@table\mylattable
	
	\let\contentsline\tabcontentsline
	
	\let\numberline\tabnumberline
	
	\let\addvspace\@gobble
	
	\@starttoc{lot}%
	
	\zihao{5}
	
	\vspace{0pt} %
	
	\begin{longtable}{@{}|C{2.5cm}|C{\linewidth-5cm}|C{2.5cm-6\tabcolsep-4\arrayrulewidth}|@{}}
		\hline
		
		表序号 & 表名称 & 页码 \\ \hline \endhead
		
		\UsetabEntries
		
	\end{longtable}%  
	
	\endgroup
	
	\if@restonecol\twocolumn\fi
	
	\setcounter{table}{0}
	
	%\clearpage
	
	%\restoregeometry
}

% 新建符号
\renewcommand{\AA}{\text{Å}}





