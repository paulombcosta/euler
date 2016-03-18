module Problem004 where

-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.

import List exposing (reverse)
import String exposing (reverse, toInt)

isPalindrome : Int -> Bool
isPalindrome x = case (x |> toString |> String.reverse |> String.toInt) of
                   Result.Ok value -> value == x
                   Result.Err error -> False

highestPalindromeOf2 : Int
highestPalindromeOf2 = 0

highestPalindromeOf3 : Int
highestPalindromeOf3 = 0

genCombinationOf2 : List(Int, Int)
genCombinationOf2 =
  let
    acc : Int -> List(Int, Int) -> List(Int, Int)
    acc x xs =
      if x > 99 then xs
      else
        acc (x + 1) xs ++ (List.map ((,) x) [10..99])
   in
     acc 9 []

-- andMap : List (a -> b) -> List a -> List b -- like (<*>) in Haskell, specialised to lists
-- andMap listOfFuncs listOfAs = List.concatMap (\f -> List.map f listOfAs) listOfFuncs

-- gridOf12x24 = List.map (,) [1..12] `andMap` [1..24]

compute : Int
compute =
  case (genCombinationOf2 |> List.map (\(x,y) -> x * y) |> List.filter isPalindrome |> List.maximum) of
    Just a -> a
    Nothing -> 0
