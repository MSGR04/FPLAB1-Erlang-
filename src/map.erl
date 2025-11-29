-module(map).
-export([euler9/0, euler21/0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 9: Special Pythagorean Triplet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gen_triplets9_map() ->
    As = lists:seq(1, 998),

    ABLists =
        lists:map(
          fun(A) ->
              lists:map(
                fun(B) ->
                    {A, B, 1000 - A - B}
                end,
                lists:seq(A + 1, 999)
              )
          end,
          As
        ),

    lists:append(ABLists).


is_pyth({A, B, C}) ->
    A*A + B*B =:= C*C.

euler9() ->
    Triplets = gen_triplets9_map(),                       
    Pyth     = lists:filter(fun is_pyth/1, Triplets),     
    {A, B, C} = hd(Pyth),                                   
    lists:foldl(fun(X, Acc) -> X * Acc end, 1, [A, B, C]). 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 21: Amicable numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d(N) when N > 1 ->
    Divs = [K || K <- lists:seq(1, N div 2), N rem K =:= 0],
    lists:sum(Divs);
d(1) ->
    0.

is_amicable_pair({A, D}) ->
    A =/= D andalso d(D) =:= A.


euler21() ->
    Ns = lists:seq(2, 9999),

    Pairs = lists:map(fun(N) -> {N, d(N)} end, Ns),

    Amic = lists:filter(fun is_amicable_pair/1, Pairs),

    lists:foldl(
      fun({N, _}, Sum) -> N + Sum end,
      0,
      Amic
    ).
