-- Each new term in the Fibonacci sequence is generated by adding the previous two terms.
--      By starting with 1 and 2, the first 10 terms will be:
--        1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
--         By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

module Problem002 where

import List exposing (map, filter)
import Html exposing (text)

main = compute
     |> toString
     |> text

type alias FibAcc = (Int, Int, List Int)

getFibList : FibAcc -> List Int
getFibList (_, _, xs) = xs

nextFib : FibAcc -> FibAcc
nextFib (penult, last, acc) =
  let nextFib = penult + last
  in
    (last, nextFib, acc ++ [nextFib])

fourMil : Int
fourMil = 4000000

genFib : FibAcc -> FibAcc
genFib (penult, last, acc) =
  let newLast = penult + last
  in
    if (last > fourMil) then (penult, last, acc) else genFib (last, newLast, acc ++ [newLast])

compute : Int
compute =
  let
    fullList = genFib (1,2, [1,2])
  in
    fullList |> getFibList |> List.filter (\x -> x % 2 == 0) |> List.sum