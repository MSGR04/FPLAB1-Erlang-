-module(lab1).

-export([euler9/0, euler21/0, demo/0]).


euler9() ->
    tail_recursion:euler9().

euler21() ->
    tail_recursion:euler21().

demo() ->
    Tail9  = tail_recursion:euler9(),
    Reg9   = regular_recursion:euler9(),
    Mod9   = module:euler9(),
    Map9   = map:euler9(),
    List9  = list:euler9(),

    Tail21 = tail_recursion:euler21(),
    Reg21  = regular_recursion:euler21(),
    Mod21  = module:euler21(),
    Map21  = map:euler21(),
    List21 = list:euler21(),

    io:format("Euler 9  (tail recursion)     = ~p~n", [Tail9]),
    io:format("Euler 9  (regular recursion)  = ~p~n", [Reg9]),
    io:format("Euler 9  (modular style)      = ~p~n", [Mod9]),
    io:format("Euler 9  (map generation)     = ~p~n", [Map9]),
    io:format("Euler 9  (list comprehension) = ~p~n~n", [List9]),

    io:format("Euler 21 (tail recursion)     = ~p~n", [Tail21]),
    io:format("Euler 21 (regular recursion)  = ~p~n", [Reg21]),
    io:format("Euler 21 (modular style)      = ~p~n", [Mod21]),
    io:format("Euler 21 (map generation)     = ~p~n", [Map21]),
    io:format("Euler 21 (list comprehension) = ~p~n", [List21]),
    ok.


