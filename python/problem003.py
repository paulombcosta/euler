# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

import math

_num = 600851475143

def factors_of(num):
    factors = []
    for i in range(2, int(math.sqrt(num))):
        quot_rest = divmod(num, i)
        if quot_rest[1] == 0:
            factors.insert(0, quot_rest[0])
            factors.insert(0, i)
    return factors

def is_prime(n):
    for i in range(2, (int(math.sqrt(n)))):
        if n % i == 0:
            return False;
    return True;

def compute():
    factors = factors_of(_num)
    highest_prime_factor = 1;
    for f in factors:
        if (is_prime(f)):
            if f > highest_prime_factor:
                highest_prime_factor = f
    print "Highest prime factor is " + str(highest_prime_factor)

if __name__ == "__main__":
    compute()
