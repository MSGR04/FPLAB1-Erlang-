-module(module).
-export([euler9/0, euler21/0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 9: Special Pythagorean Triplet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gen_triplets9() ->
    [ {A, B, 1000 - A - B}
      || A <- lists:seq(1, 998),
         B <- lists:seq(A + 1, 999),
         A + B < 1000
    ].

is_pyth({A, B, C}) ->
    A*A + B*B =:= C*C.

euler9() ->
    Triplets = gen_triplets9(),                  
    Pythag   = lists:filter(fun is_pyth/1, Triplets), 
    {A, B, C} = hd(Pythag),                      
    lists:foldl(fun(X, Acc) -> X * Acc end, 1, [A, B, C]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 21: Amicable Numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gen_nums21() ->
    lists:seq(2, 9999).

d(N) when N > 1 ->
    Divs = [K || K <- lists:seq(1, N div 2),
                  N rem K =:= 0],
    lists:sum(Divs);
d(1) ->
    0.

%% проверка на дружественность
is_amicable(A) ->
    B = d(A),
    A =/= B andalso d(B) =:= A.

euler21() ->
    Numbers = gen_nums21(),                         
    Amic    = lists:filter(fun is_amicable/1, Numbers),   
    lists:foldl(fun(X, Sum) -> X + Sum end, 0, Amic).     
