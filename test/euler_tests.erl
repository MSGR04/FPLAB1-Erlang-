-module(euler_tests).

-include_lib("eunit/include/eunit.hrl").

%% ---------- Tests for Problem 9 ----------

euler9_tail_test() ->
    ?assertEqual(31875000, tail_recursion:euler9()).

euler9_regular_test() ->
    ?assertEqual(31875000, regular_recursion:euler9()).

euler9_module_test() ->
    ?assertEqual(31875000, module:euler9()).

euler9_map_test() ->
    ?assertEqual(31875000, map:euler9()).

euler9_list_test() ->
    ?assertEqual(31875000, list:euler9()).

%% ---------- Tests for Problem 21 ----------

euler21_tail_test() ->
    ?assertEqual(31626, tail_recursion:euler21()).

euler21_regular_test() ->
    ?assertEqual(31626, regular_recursion:euler21()).

euler21_module_test() ->
    ?assertEqual(31626, module:euler21()).

euler21_map_test() ->
    ?assertEqual(31626, map:euler21()).

euler21_list_test() ->
    ?assertEqual(31626, list:euler21()).
