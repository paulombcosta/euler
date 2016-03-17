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
