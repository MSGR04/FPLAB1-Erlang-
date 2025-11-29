%% list.erl
%% Реализация задач Эйлера с использованием list comprehensions

-module(list).
-export([euler9/0, euler21/0]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 9: Pythagorean triplet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

euler9() ->
    hd([
        A * B * C
        || A <- lists:seq(1, 998),
           B <- lists:seq(A + 1, 999),
           C <- lists:seq(B + 1, 1000),
           A + B + C =:= 1000,
           A*A + B*B =:= C*C
    ]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Problem 21: Amicable numbers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d(N) when N > 1 ->
    lists:sum([K || K <- lists:seq(1, N div 2),
                      N rem K =:= 0]);
d(1) ->
    0.

euler21() ->
    lists:sum([
        N
        || N <- lists:seq(2, 9999),
           M <- [d(N)],      %% вместо M = d(N)
           M =/= N,
           d(M) =:= N
    ]).
