-module(gaussJordan).
-include("../include/gaussJordan.hrl").
-export([unos/4]).

unos(_Lista,0,_Cl,_It) ->"Matriz invalida";
unos({[H|_T],Lista},1,Cl,It) ->ceros(Lista,H,It,Cl);
unos({agrega,_Slista},{[],_Pivote},_Cl,{_It,_PosA})->[];
unos({agrega,Slista},{[_H|T],Pivote},Cl,{It,It})->
	[Slista|unos({agrega,Slista},{T,Pivote},Cl,{It,It+1})];
unos({agrega,Slista},{[H|T],Pivote},Cl,{It,PosA})->
	[H|unos({agrega,Slista},{T,Pivote},Cl,{It,PosA+1})];
unos(Slista,{Lista,Pivote},Cl,It)->
	ceros(unos({agrega,Slista},{Lista,Pivote},Cl,{It,1}),Slista,It,Cl);
unos(Lista,Pivote,Cl,It)->
	%io:format("renglon ~p ~n",[[((X*1)/Pivote)||X<-pivote:pivote(Lista,It)]]), 
	unos([((X*?Numerador)/Pivote)||X<-pivote:pivote(Lista,It)],{Lista,Pivote},Cl,It).

ceros(Lista,Slista,It,Cl)->
	main:iniciar(ceros(Lista,Slista,It,1,Cl),It+1,Cl). 
ceros([H|T],Slista,It,It,Cl)-> 
	[H|ceros(T,Slista,It,It+1,Cl)];
ceros(multiplica,[],[],_Cl,_Pivote)->[];
ceros(multiplica,[H1|T1],[H2|T2],Cl,Pivote)->[((-Pivote*H2)+H1)|ceros(multiplica,T1,T2,Cl,Pivote)];
ceros([],_Slista,_It,_PosA,_Cl)->[];
ceros([H|T],Slista,It,PosA,Cl)->
	[ceros(multiplica,H,Slista,Cl,pivote:pivote(H,It))|ceros(T,Slista,It,PosA+1,Cl)]. 
