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
  margin-top: 4px;
  margin-bottom: 4px;
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
	padding: .5em;
	margin: .5em;
}

redHeader,
redFormSpace {
	background: #fbD5c7;
	border-color: #8db243;
	border-radius: 0px 0.5em 0.5em;
	border: 1px solid;
	padding: .5em;
	margin: .5em;
}

div.table { 
  display: table; 
  width: calc(100% - 10px);
	border: thin solid #999999;
	padding: 5px;
}
div.table20 { 
  display: table; 
  width: calc(20% - 10px);
	border: thin solid #999999;
	padding: 5px;
}
div.table30 { 
  display: table; 
  width: calc(30% - 10px);
	border: thin solid #999999;
	padding: 5px;
}
div.table50 { 
  display: table; 
  width: calc(50% - 10px);
	border: thin solid #999999;
	padding: 5px;
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
  padding:5px; 
}
</style>'.

baueOptionsFeld(FeldName, OptionsWerteListe, Index, OptionList) :-
	string_concat('<select name="', FeldName, ListString0),
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
	sort(OptionsWerteListe, OptionsWerteSet),
	BisherList = '<option>Bitte wählen</option>',
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