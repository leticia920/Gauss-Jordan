-module(pivote).
-export([pivote/2]).

pivote([H|_T],1)->
	H;
pivote([_H|T],N)->
	pivote(T,N-1).
