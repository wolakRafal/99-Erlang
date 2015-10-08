%%%-------------------------------------------------------------------
%%% @author Rafal Wolak
%%% @copyright (C) 2015, robo software innovations
%%% @doc
%%%
%%% @end
%%% Created : 08. paŸ 2015 20:18
%%%-------------------------------------------------------------------
-module(p1_10).
-author("Rafal Wolak").

%% API
-compile(export_all).

%% P01 (*) Find the last element of a list.
%% Example:
%% scala> last(List(1, 1, 2, 3, 5, 8))
%% res0: Int = 8
last(L) -> lists:last(L).


%% P02 (*) Find the last but one element of a list.
%% Example:
%% scala> penultimate(List(1, 1, 2, 3, 5, 8))
%% res0: Int = 5
penultimate([_ | T]) -> lists:last(T).

%% P03 (*) Find the Kth element of a list.
%% By convention, the first element in the list is element 0.
%% Example:
%% scala> nth(2, List(1, 1, 2, 3, 5, 8))
%% res0: Int = 2
nth(N, L) -> lists:nth(N, L).

%% P04 (*) Find the number of elements of a list.
%% Example:
%% scala> length(List(1, 1, 2, 3, 5, 8))
%% res0: Int = 6
length(L) -> erlang:length(L).

%% P05 (*) Reverse a list.
%% Example:
%% scala> reverse(List(1, 1, 2, 3, 5, 8))
%% res0: List[Int] = List(8, 5, 3, 2, 1, 1)
reverse(L) -> lists:reverse(L).

%% P06 (*) Find out whether a list is a palindrome.
%% Example:
%% scala> isPalindrome(List(1, 2, 3, 2, 1))
%% res0: Boolean = true
isPalindrome(L) when erlang:length(L) < 2 -> true;
isPalindrome(L) when Len = erlang:length(L) rem 2 =:= 0 ->
  {L1, L2} = lists:split(trunc(Len / 2), L),
  L1 =:= reverse(L2);
isPalindrome(L) when Len = erlang:length(L) rem 2 =:= 1 ->
  X = trunc(Len / 2),
  lists:sublist(L, X) =:= reverse(lists:sublist(L, X + 1, X)).

%% P07 (**) Flatten a nested list structure.
%% Example:
%% scala> flatten(List(List(1, 1), 2, List(3, List(5, 8))))
%% res0: List[Any] = List(1, 1, 2, 3, 5, 8)

%% P08 (**) Eliminate consecutive duplicates of list elements.
%% If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.
%% Example:
%%
%% scala> compress(List('a, 'a, 'a, 'a, 'b, 'c, 'c, 'a, 'a, 'd, 'e, 'e, 'e, 'e))
%% res0: List[Symbol] = List('a, 'b, 'c, 'a, 'd, 'e)

%% P09 (**) Pack consecutive duplicates of list elements into sublists.
%% If a list contains repeated elements they should be placed in separate sublists.
%% Example:
%%
%% scala> pack(List('a, 'a, 'a, 'a, 'b, 'c, 'c, 'a, 'a, 'd, 'e, 'e, 'e, 'e))
%% res0: List[List[Symbol]] = List(List('a, 'a, 'a, 'a), List('b), List('c, 'c), List('a, 'a), List('d), List('e, 'e, 'e, 'e))

%% P10 (*) Run-length encoding of a list.
%% Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as tuples (N, E) where N is the number of duplicates of the element E.
%% Example:
%%
%% scala> encode(List('a, 'a, 'a, 'a, 'b, 'c, 'c, 'a, 'a, 'd, 'e, 'e, 'e, 'e))
%% res0: List[(Int, Symbol)] = List((4,'a), (1,'b), (2,'c), (2,'a), (1,'d), (4,'e))
