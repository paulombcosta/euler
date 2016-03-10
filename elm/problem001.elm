-- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

module Problem001 where

import List exposing (..)
import String exposing (..)
import Html exposing (text)

main = sum
     |> toString
     |> text

sum : Int
sum = List.sum (List.filter (\x -> x % 3 == 0 || x % 5 == 0) [1..999])
