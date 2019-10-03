:- module(systemNamenDialog, [systemNamenDialog/1]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

:- http_handler('/systemNamenDialog', systemNamenDialog, []).
:- http_handler('/systemNamen', systemNamen, []).

systemNamenDialog(_Request) :-
	findall(FeldNo1, between(101, 120, FeldNo1), FeldNoList1),
	findall(FeldNo2, between(201, 220, FeldNo2), FeldNoList2),
	findall(FeldNo3, between(301, 320, FeldNo3), FeldNoList3),
	TermerizedBody = [
		\['<header>'],
	    h1([align(center)], ['Eingabe der Sternensysteme']),
	    \['</header>'],
		\['<formSpace>'],       
	    form([action('/systemNamen'), method('post'), id("sternenSystemEingabe")], 
	       	 [table([width("100%"), border("1"), cellspacing("3"), cellpadding("2")],
	       	        [tr([td([table([width("100%"), border("1"), cellspacing("1"), cellpadding("1")], 
	       	                	   [tr([th([scope("col")],['System-Name']),
	       	                            th([scope("col")],['Farbe'])
	       	                	       ]),
	       	                	    \eingabeZeile(FeldNoList1)
	       	                	   ])
	       	        	    ]),
	       	         	 td([table([width("100%"), border("1"), cellspacing("1"), cellpadding("1")], 
	       	                	   [tr([th([scope("col")],['System-Name']),
	       	                            th([scope("col")],['Farbe'])
	       	                	       ]),
	       	                	    \eingabeZeile(FeldNoList2)
	       	                	   ])
	       	        	    ]),
	       	             td([table([width("100%"), border("1"), cellspacing("1"), cellpadding("1")], 
	       	                	   [tr([th([scope("col")],['System-Name']),
	       	                            th([scope("col")],['Farbe'])
	       	                	       ]),
	       	                	    \eingabeZeile(FeldNoList3)
	       	                	   ])
	       	                ])
	       	            ])
	       	        ]),
			    	table([width("12%"), border("0"), cellspacing("3"), cellpadding("2")],
			    	      [td([button([name("submit"), type("submit")], 'OK')]),
			    		   td([button([name("reset"), type("reset")], 'reset')])
			    	      ])
			      ]),
		\['</formSpace>']
		             ],       
	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('systemNamenDialog')],
	reply_html_page(TermerizedHead, TermerizedBody).

eingabeZeile([]) -->
	[].

eingabeZeile([FeldNo|Rest]) -->
	html([tr([td(input([name('systemName' + FeldNo), type("text"), maxlength("40")])),
			  td([select([name('farbe' + FeldNo), size("1")],
					     [option([selected("selected")],['gelb']),
					 	  option(['rot']),
					 	  option(['grün']),
		   	         	  option(['blau'])
		   	        	 ])
   	   			 ])
   	         ])
   	   ]),
   	   eingabeZeile(Rest).   	   
 
systemNamen(Request) :-
	member(method(post), Request), !,
	http_parameters(Request, [
      systemName101(System101, [default('')]), farbe101(Farbe101, [length > 1]),
      systemName102(System102, [default('')]), farbe102(Farbe102, [length > 1]),
      systemName103(System103, [default('')]), farbe103(Farbe103, [length > 1]),
      systemName104(System104, [default('')]), farbe104(Farbe104, [length > 1]),
      systemName105(System105, [default('')]), farbe105(Farbe105, [length > 1]),
      systemName106(System106, [default('')]), farbe106(Farbe106, [length > 1]),
      systemName107(System107, [default('')]), farbe107(Farbe107, [length > 1]),
      systemName108(System108, [default('')]), farbe108(Farbe108, [length > 1]),
      systemName109(System109, [default('')]), farbe109(Farbe109, [length > 1]),
      systemName110(System110, [default('')]), farbe110(Farbe110, [length > 1]),
      systemName111(System111, [default('')]), farbe111(Farbe111, [length > 1]),
      systemName112(System112, [default('')]), farbe112(Farbe112, [length > 1]),
      systemName113(System113, [default('')]), farbe113(Farbe113, [length > 1]),
      systemName114(System114, [default('')]), farbe114(Farbe114, [length > 1]),
      systemName115(System115, [default('')]), farbe115(Farbe115, [length > 1]),
      systemName116(System116, [default('')]), farbe116(Farbe116, [length > 1]),
      systemName117(System117, [default('')]), farbe117(Farbe117, [length > 1]),
      systemName118(System118, [default('')]), farbe118(Farbe118, [length > 1]),
      systemName119(System119, [default('')]), farbe119(Farbe119, [length > 1]),
      systemName120(System120, [default('')]), farbe120(Farbe120, [length > 1]),
      
      systemName201(System201, [default('')]), farbe201(Farbe201, [length > 1]),
      systemName202(System202, [default('')]), farbe202(Farbe202, [length > 1]),
      systemName203(System203, [default('')]), farbe203(Farbe203, [length > 1]),
      systemName204(System204, [default('')]), farbe204(Farbe204, [length > 1]),
      systemName205(System205, [default('')]), farbe205(Farbe205, [length > 1]),
      systemName206(System206, [default('')]), farbe206(Farbe206, [length > 1]),
      systemName207(System207, [default('')]), farbe207(Farbe207, [length > 1]),
      systemName208(System208, [default('')]), farbe208(Farbe208, [length > 1]),
      systemName209(System209, [default('')]), farbe209(Farbe209, [length > 1]),
      systemName210(System210, [default('')]), farbe210(Farbe210, [length > 1]),
      systemName211(System211, [default('')]), farbe211(Farbe211, [length > 1]),
      systemName212(System212, [default('')]), farbe212(Farbe212, [length > 1]),
      systemName213(System213, [default('')]), farbe213(Farbe213, [length > 1]),
      systemName214(System214, [default('')]), farbe214(Farbe214, [length > 1]),
      systemName215(System215, [default('')]), farbe215(Farbe215, [length > 1]),
      systemName216(System216, [default('')]), farbe216(Farbe216, [length > 1]),
      systemName217(System217, [default('')]), farbe217(Farbe217, [length > 1]),
      systemName218(System218, [default('')]), farbe218(Farbe218, [length > 1]),
      systemName219(System219, [default('')]), farbe219(Farbe219, [length > 1]),
      systemName220(System220, [default('')]), farbe220(Farbe220, [length > 1]),
      
      systemName301(System301, [default('')]), farbe301(Farbe301, [length > 1]),
      systemName302(System302, [default('')]), farbe302(Farbe302, [length > 1]),
      systemName303(System303, [default('')]), farbe303(Farbe303, [length > 1]),
      systemName304(System304, [default('')]), farbe304(Farbe304, [length > 1]),
      systemName305(System305, [default('')]), farbe305(Farbe305, [length > 1]),
      systemName306(System306, [default('')]), farbe306(Farbe306, [length > 1]),
      systemName307(System307, [default('')]), farbe307(Farbe307, [length > 1]),
      systemName308(System308, [default('')]), farbe308(Farbe308, [length > 1]),
      systemName309(System309, [default('')]), farbe309(Farbe309, [length > 1]),
      systemName310(System310, [default('')]), farbe310(Farbe310, [length > 1]),
      systemName311(System311, [default('')]), farbe311(Farbe311, [length > 1]),
      systemName312(System312, [default('')]), farbe312(Farbe312, [length > 1]),
      systemName313(System313, [default('')]), farbe313(Farbe313, [length > 1]),
      systemName314(System314, [default('')]), farbe314(Farbe314, [length > 1]),
      systemName315(System315, [default('')]), farbe315(Farbe315, [length > 1]),
      systemName316(System316, [default('')]), farbe316(Farbe316, [length > 1]),
      systemName317(System317, [default('')]), farbe317(Farbe317, [length > 1]),
      systemName318(System318, [default('')]), farbe318(Farbe318, [length > 1]),
      systemName319(System319, [default('')]), farbe319(Farbe319, [length > 1]),
      systemName320(System320, [default('')]), farbe320(Farbe320, [length > 1])
    ]),
    abolish(spielStatus:systeme/2),
    (System101 = ''; assertz(spielStatus:systeme(System101, Farbe101))),
    (System102 = ''; assertz(spielStatus:systeme(System102, Farbe102))),
    (System103 = ''; assertz(spielStatus:systeme(System103, Farbe103))),
    (System104 = ''; assertz(spielStatus:systeme(System104, Farbe104))),
    (System105 = ''; assertz(spielStatus:systeme(System105, Farbe105))),
    (System106 = ''; assertz(spielStatus:systeme(System106, Farbe106))),
    (System107 = ''; assertz(spielStatus:systeme(System107, Farbe107))),
    (System108 = ''; assertz(spielStatus:systeme(System108, Farbe108))),
    (System109 = ''; assertz(spielStatus:systeme(System109, Farbe109))),
    (System110 = ''; assertz(spielStatus:systeme(System110, Farbe110))),
    (System111 = ''; assertz(spielStatus:systeme(System111, Farbe111))),
    (System112 = ''; assertz(spielStatus:systeme(System112, Farbe112))),
    (System113 = ''; assertz(spielStatus:systeme(System113, Farbe113))),
    (System114 = ''; assertz(spielStatus:systeme(System114, Farbe114))),
    (System115 = ''; assertz(spielStatus:systeme(System115, Farbe115))),
    (System116 = ''; assertz(spielStatus:systeme(System116, Farbe116))),
    (System117 = ''; assertz(spielStatus:systeme(System117, Farbe117))),
    (System118 = ''; assertz(spielStatus:systeme(System118, Farbe118))),
    (System119 = ''; assertz(spielStatus:systeme(System119, Farbe119))),
    (System120 = ''; assertz(spielStatus:systeme(System120, Farbe120))),
    
    (System201 = ''; assertz(spielStatus:systeme(System201, Farbe201))),
    (System202 = ''; assertz(spielStatus:systeme(System202, Farbe202))),
    (System203 = ''; assertz(spielStatus:systeme(System203, Farbe203))),
    (System204 = ''; assertz(spielStatus:systeme(System204, Farbe204))),
    (System205 = ''; assertz(spielStatus:systeme(System205, Farbe205))),
    (System206 = ''; assertz(spielStatus:systeme(System206, Farbe206))),
    (System207 = ''; assertz(spielStatus:systeme(System207, Farbe207))),
    (System208 = ''; assertz(spielStatus:systeme(System208, Farbe208))),
    (System209 = ''; assertz(spielStatus:systeme(System209, Farbe209))),
    (System210 = ''; assertz(spielStatus:systeme(System210, Farbe210))),
    (System211 = ''; assertz(spielStatus:systeme(System211, Farbe211))),
    (System212 = ''; assertz(spielStatus:systeme(System212, Farbe212))),
    (System213 = ''; assertz(spielStatus:systeme(System213, Farbe213))),
    (System214 = ''; assertz(spielStatus:systeme(System214, Farbe214))),
    (System215 = ''; assertz(spielStatus:systeme(System215, Farbe215))),
    (System216 = ''; assertz(spielStatus:systeme(System216, Farbe216))),
    (System217 = ''; assertz(spielStatus:systeme(System217, Farbe217))),
    (System218 = ''; assertz(spielStatus:systeme(System218, Farbe218))),
    (System219 = ''; assertz(spielStatus:systeme(System219, Farbe219))),
    (System220 = ''; assertz(spielStatus:systeme(System220, Farbe220))),

    (System301 = ''; assertz(spielStatus:systeme(System301, Farbe301))),
    (System302 = ''; assertz(spielStatus:systeme(System302, Farbe302))),
    (System303 = ''; assertz(spielStatus:systeme(System303, Farbe303))),
    (System304 = ''; assertz(spielStatus:systeme(System304, Farbe304))),
    (System305 = ''; assertz(spielStatus:systeme(System305, Farbe305))),
    (System306 = ''; assertz(spielStatus:systeme(System306, Farbe306))),
    (System307 = ''; assertz(spielStatus:systeme(System307, Farbe307))),
    (System308 = ''; assertz(spielStatus:systeme(System308, Farbe308))),
    (System309 = ''; assertz(spielStatus:systeme(System309, Farbe309))),
    (System310 = ''; assertz(spielStatus:systeme(System310, Farbe310))),
    (System311 = ''; assertz(spielStatus:systeme(System311, Farbe311))),
    (System312 = ''; assertz(spielStatus:systeme(System312, Farbe312))),
    (System313 = ''; assertz(spielStatus:systeme(System313, Farbe313))),
    (System314 = ''; assertz(spielStatus:systeme(System314, Farbe314))),
    (System315 = ''; assertz(spielStatus:systeme(System315, Farbe315))),
    (System316 = ''; assertz(spielStatus:systeme(System316, Farbe316))),
    (System317 = ''; assertz(spielStatus:systeme(System317, Farbe317))),
    (System318 = ''; assertz(spielStatus:systeme(System318, Farbe318))),
    (System319 = ''; assertz(spielStatus:systeme(System319, Farbe319))),
    (System320 = ''; assertz(spielStatus:systeme(System320, Farbe320))),
    
   	server:holeCssAlsStyle(StyleString),
	TermerizedHead = [\[StyleString], title('systemNamenDialog')],
	TermerizedBody = [
		\['<header>'],
		h3(align(center),'gespeichert!'),
		\['</header>']
		             ],
	reply_html_page(TermerizedHead, TermerizedBody).
