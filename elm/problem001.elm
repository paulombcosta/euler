import Graphics.Element exposing (..)
import List exposing (..)

    -- If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

    -- Find the sum of all the multiples of 3 or 5 below 1000. 

main = Graphics.Element.show sum

sum : number
sum = List.sum (filter (\x -> x % 3 == 0 || x % 5 == 0) [1..999])
