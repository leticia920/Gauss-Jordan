%Leticia Hernàndez Villanueva <leticia.hvillanueva@gmail.com>
%Description:
%This program is about  an algorithm for solving systems of linear equations 
%(also known as row reduction or Gaussian elimination).
%input data: main:main([[1,2,4,4,2,1,1],[4,2,3,4,5,1,3],[4,2,4,5,4,1,1],[3,2,4,5,6,1,1],[1,2,3,4,5,6,1],[2,1,2,1,2,1,1]]).
-module(main).
-export([main/1,iniciar/3]).

main(Lista)-> case verificarMatriz(Lista) of
    {si,Cl}->iniciar(Lista,1,Cl);
    no-> "No es valida la matriz" end.
    
verificarMatriz(Lista)->
    verificarMatriz(Lista,[],0,0). 
verificarMatriz({elementos,T},[],Cl,Cl)->
    verificarMatriz(ok,T,0,Cl);     
verificarMatriz({elementos,_T},[],_Ce,_Cl)->no;
verificarMatriz({elementos,T},[_H1|T1],Ce,Cl)->
    verificarMatriz({elementos,T},T1,Ce+1,Cl);
verificarMatriz(ok,[H|T],Ce,Cl)->
    verificarMatriz({elementos,T},H,Ce,Cl);
verificarMatriz(ok,[],_Ce,Cl)->{si,Cl}; 
verificarMatriz([],Lista,Ce,Cl)-> 
    verificarMatriz(ok,Lista,Ce,Cl+1); 
verificarMatriz([H|T],Lista,Ce,Cl)->
    verificarMatriz(T,Lista++[H],Ce,Cl+1).

iniciar([],It,It)->[];	
iniciar([H|T],It,It)->[print:tratamiento(H,1,It),[pivote:pivote(H,It)]|iniciar(T,It,It)];
iniciar(Lista,It,Cl)->
	gaussJordan:unos(Lista,pivote:pivote(pivote:pivote(Lista,It),It),Cl,It).
