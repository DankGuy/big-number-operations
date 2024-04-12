# Big Number Operations

## Overview

Big Number Operations is a Delphi-based project that aims to handle numbers that are too large to be stored as integers. These large numbers, also known as "Big Numbers", are stored as strings and are manipulated using specific algorithms that are capable of performing operations such as addition, subtraction, and multiplication.

## What is a Big Number?

A "Big Number" is a number that is too large to be stored as a standard integer in most programming languages. For instance, in Delphi, the largest number that can be represented by an integer is 2147483647 (for a 32-bit integer) or 9223372036854775807 (for a 64-bit integer). Any number larger than this would cause an overflow.

Big Numbers are typically used in fields like cryptography, physics, and mathematics where operations with extremely large numbers are common.

## How Does Big Number Operations Work?

Instead of storing numbers as integers, BigNumber stores them as strings. This allows us to bypass the limitations of integer storage, since strings can be of virtually any length. The operations (addition, subtraction, and multiplication) on these Big Numbers are performed using special algorithms, designed to work with string representations of numbers.

## Operations

The Big Number Operations library currently supports the following operations:

- **Addition:** The addition operation takes two Big Numbers represented as strings and returns their sum as a string.

- **Array Addition:** The array addition operatuion takes an array of Big Numbers represented as strings and returns their sum as a string.

- **Subtraction:** The subtraction operation takes two Big Numbers and returns the result of their subtraction as a string.

- **Multiplication:** The multiplication operation takes two Big Numbers and returns the result of their multiplication as a string.

## Testing
We have a set of test cases to ensure the reliability and accuracy of our Big Number Operations library. You can access and review these test cases [here](https://github.com/DankGuy/big-number-operations/blob/main/BigNumber.TestCase.pas).

1. Addition using 2 big numbers
2. Addition using multiple big numbers
3. Addition using zeros
4. Multiplication using 2 big numbers
5. Positive subtraction
6. Negative subtraction
7. Eliminating leading zeros
8. Mixture of Multiplication and Subtraction