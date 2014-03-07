-module(print).
-export([tratamiento/3]).

tratamiento([_H1|_T1],Cl,Cl)->[];
tratamiento([H1|T1],PosA,Cl)->
	[H1|tratamiento(T1,PosA+1,Cl)].
	
