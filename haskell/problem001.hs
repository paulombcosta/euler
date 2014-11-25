multipleOfThree x = x `mod` 3 == 0
multipleOfFive x = x `mod` 5 == 0
multipleOfThreeOrFive x = multipleOfThree x || multipleOfFive x
numbers = [1..999]
main = print(sum (filter (multipleOfThreeOrFive) numbers))
