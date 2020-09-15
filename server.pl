:- module(server, [server/1, holeCssAlsStyle/1, baueOptionsFeld/4]).

:- use_module(library(dcg/basics)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_parameters)).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).

:- http_handler('/favicon.ico', dummy, []).

holeCssAlsStyle(StyleString) :-
	StyleString = '<style>
body {
    margin: 0 auto;
    max-width: 85em;	
    display: grid;
  	grid-template-columns: repeat(3, 1fr); 
  	grid-template-rows: 160px auto, 30px; 
	}
header {
	grid-column: 1 / 4;
	grid-row: 1;
    }
redHeader {
	grid-column: 1 / 4;
	grid-row: 1;
    }
redFormSpace {
	grid-column: 1 / 4;
	grid-row: 2;
	}
formSpace {
	grid-column: 1 / 4;
	grid-row: 2;
	}
button1Space {
	grid-column: 1;
	grid-row: 3;
	}
button2Space {
	grid-column: 2;
	grid-row: 3;
	}
button3Space {
	grid-column: 3;
	grid-row: 3;
	}

#compactText {
  font-family:Arial,sans-serif; 
  font-size: 1em; 
  color:black;
  margin-top: 0.3em;
  margin-bottom: 0.3em;
  }

.text40Format {
  width: 30ch;
}

header,
formSpace,
button1Space,
button2Space,
button3Space {
	background: #ebf5d7;
	border-color: #8db243;
	border-radius: 0px 0.5em 0.5em;
	border: 1px solid;
	padding: 0.5em;
	margin: 0.5em;
}

redHeader,
redFormSpace {
	background: #fbD5c7;
	border-color: #8db243;
	border-radius: 0px 0.5em 0.5em;
	border: 1px solid;
	padding: 0.5em;
	margin: 0.5em;
}

div.table { 
  display: table; 
  width: calc(100% - 0.6em);
	border: thin solid #999999;
	padding: 0.3em;
}
div.table20 { 
  display: table; 
  width: calc(20% - 0.6em);
	border: thin solid #999999;
	padding: 0.3em;
}
div.table30 { 
  display: table; 
  width: calc(30% - 0.6em);
	border: thin solid #999999;
	padding: 0.3em;
}
div.table50 { 
  display: table; 
  width: calc(50% - 0.6em);
	border: thin solid #999999;
	padding: 0.3em;
}
div.table70 { 
  display: table; 
  width: calc(70% - 0.6em);
	border: thin solid #999999;
	padding: 0.3em;
}
div.tr { 
  display:table-row; 
}
div.th { 
  display:table-cell; 
  border:thin solid #CCCCCC; 
  padding:5px; 
  font-style:normal;
  font-variant: normal;
  font-weight: 300;
  font-size 18px;
  font-family: Arial, Helvetica, sans-serif
}
div.td { 
  display:table-cell; 
  border:thin solid #CCCCCC; 
  padding:0.3em; 
}
.kastenGelb{
	fill:	rgb(223,172,32);
	stroke-width:	1px;
	stroke:	rgb(40,130,225);
}
.pfeilLinie{
	fill:none;fill-rule:	evenodd;
	stroke:					#000000;
	stroke-width:			2;
	stroke-linecap:			butt;
	stroke-linejoin:		miter;
	stroke-opacity:			1;
	stroke-miterlimit:		4;
	stroke-dasharray:		none;
	marker-end:				url(#Arrow2Lend)
}
.stoffText{
	font-style:normal;
	font-weight:normal;
	font-size:17.63888889px;
	line-height:125%;
	font-family:sans-serif;
	letter-spacing:0px;
	word-spacing:0px;
	fill:#000000;
	fill-opacity:1;
	stroke:none;
	stroke-width:0.26458332px;
	stroke-linecap:butt;
	stroke-linejoin:miter;
	stroke-opacity:1;
	font-stretch:normal;
	font-variant:normal;
	text-anchor:start;
	text-align:center;
	writing-mode:lr;
	font-variant-ligatures:normal;
	font-variant-caps:normal;
	font-variant-numeric:normal;
	font-feature-settings:normal;
}
</style>'.

baueOptionsFeld(FeldName, OptionsWerteListe, Index, OptionList) :-
	string_concat('<select class="text40Format" name="', FeldName, ListString0),
	string_concat(ListString0, '" id="', ListString1),
	string_concat(ListString1, FeldName, ListString2),
	string_concat(ListString2, '" size="1" tabindex="', ListString3),
	string_concat(ListString3, Index, ListString4),
	string_concat(ListString4, '">', ListString5),
	baueOptionen(OptionsWerteListe, Optionen),
	string_concat(ListString5, Optionen, ListString6),
	string_concat(ListString6, '</select>', ListString7),
	OptionList = [\[ListString7]].

baueOptionen(OptionsWerteListe, Optionen) :-
	textResources:getText(txtBitteWaehlen, TxtBitteWaehlen),
	sort(OptionsWerteListe, OptionsWerteSet),
	BisherList0 = '<option>',
	string_concat(BisherList0, TxtBitteWaehlen, BisherList1),
	string_concat(BisherList1, '</option>', BisherList),
	baueOption(OptionsWerteSet, BisherList, Optionen).
	
baueOption(OptionsWerteSet, BisherList, NextList) :-
	OptionsWerteSet = [],
	BisherList = NextList.

baueOption(OptionsWerteSet, BisherList, NextList) :-
	OptionsWerteSet = [Option|Rest],
	string_concat('<option>', Option, OptionString0),
	string_concat(OptionString0, '</option>', OptionString1),
	string_concat(BisherList, OptionString1, BisherList2),
	baueOption(Rest, BisherList2, NextList).

dummy(_)  :-
	format('').