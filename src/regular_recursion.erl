-module(regular_recursion).
-export([euler9/0, euler21/0]).

%% ===========================
%% Problem 9: Special Pythagorean Triplet
%% ===========================

euler9() ->
    %% Берём первый найденный вариант из списка решений
    hd(search_products(1, 2)).

%% Возвращаем список возможных произведений a*b*c.

search_products(A, _B) when A >= 1000 ->
    [];
search_products(A, B) when A + B >= 1000 ->
    %% переходим к следующему A
    search_products(A + 1, A + 2);
search_products(A, B) ->
    C = 1000 - A - B,
    if
        A*A + B*B =:= C*C,
        A < B,
        B < C ->
            [A * B * C | search_products(A + 1, A + 2)];
        true ->
            search_products(A, B + 1)
    end.

%% ===========================
%% Problem 21: Amicable Numbers
%% ===========================

euler21() ->
    euler21_rec(2).


euler21_rec(N) when N >= 10000 ->
    0;
euler21_rec(N) ->
    Add =
        case is_amicable(N) of
            true  -> N;
            false -> 0
        end,
    Add + euler21_rec(N + 1).

is_amicable(A) ->
    B = d(A),
    A =/= B andalso d(B) =:= A.

d(N) when N > 1 ->
    Divs = [K || K <- lists:seq(1, N div 2),
                  N rem K =:= 0],
    lists:sum(Divs);
d(1) ->
    0.
