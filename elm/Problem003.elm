module Problem003 where

-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143 ?

import Html exposing (text)
import List exposing (maximum, length)
import Debug exposing (log)

-- Attempting a crappy version of the sieve of erathostenes

compute: Maybe Float
compute =
  let
    num = 600851475143
    limit = sqrt num |> round
    primeFactorsAcc : List Int -> Int -> List Int
    primeFactorsAcc factorList nextPossibleFactor =
      if (nextPossibleFactor >= limit) then factorList
      else
        primeFactorsAcc (factorList ++ (getFactors num nextPossibleFactor)) (nextPossibleFactor + 1)
  in
    primeFactorsAcc [] 2 |> List.map toFloat |> List.filter isPrime |> maximum

isPrime : Float -> Bool
isPrime x = [2..round (sqrt x)]
          |> List.filter (\y -> (round x) % y == 0)
          |> List.length
          |> (\z -> z == 0)

getFactors : Int -> Int -> List Int
getFactors dividend divisor =
  let quotient = dividend // divisor
  in
    if (quotient * divisor == dividend) then [quotient, divisor] else []

main =
  case compute of
    Just x -> x |> toString |> text
    Nothing -> text "Error computing value"
