-module(tail_recursion).
-export([euler9/0, euler21/0]).

%% ===========================
%% Problem 9: Special Pythagorean Triplet
%% ===========================

euler9() ->
    search_ab(1, 2).

search_ab(A, _B) when A >= 1000 ->
    erlang:error(no_solution);

search_ab(A, B) when A + B >= 1000 ->
    search_ab(A + 1, A + 2);

search_ab(A, B) ->
    C = 1000 - A - B,
    case (A*A + B*B =:= C*C) andalso (A < B) andalso (B < C) of
        true  -> A * B * C;
        false -> search_ab(A, B + 1)
    end.

%% ===========================
%% Problem 21: Amicable Numbers
%% ===========================

euler21() ->
    euler21(2, 0).

euler21(N, Acc) when N >= 10000 ->
    Acc;

euler21(N, Acc) ->
    NewAcc =
        case is_amicable(N) of
            true  -> Acc + N;
            false -> Acc
        end,
    euler21(N + 1, NewAcc).

is_amicable(A) ->
    B = d(A),
    A =/= B andalso d(B) =:= A.

d(N) when N > 1 ->
    Divs = [K || K <- lists:seq(1, N div 2),
                  N rem K =:= 0],
    lists:sum(Divs);

d(1) ->
    0.
