#include "NumClass.h"

int power(int base, int exp) {
    if (exp == 0) return 1;
    return base * power(base, exp - 1);
}

int numberOfDigits(int num) {
    return (num == 0) ? 0 : 1 + numberOfDigits(num / 10);
}



int isArmstrongRecursiveHelper(int num, int n) {
    if (num == 0)
        return 0;
    int digit = num % 10;
    return power(digit, n) + isArmstrongRecursiveHelper(num / 10, n);
}

int isArmstrong(int num) {
    int n = numberOfDigits(num);
    return num == isArmstrongRecursiveHelper(num, n);
}




int isPalindromeRecursiveHelper(int num, int reverse) {
    if (num == 0)
        return reverse;
    return isPalindromeRecursiveHelper(num / 10, reverse * 10 + num % 10);
}

int isPalindrome(int num) {
    return num == isPalindromeRecursiveHelper(num, 0);
}