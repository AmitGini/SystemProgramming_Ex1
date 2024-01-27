#include "NumClass.h"

int power(int base, int exp) {
    int result = 1;
    while (exp != 0) {
        result *= base;
        --exp;
    }
    return result;
}

int isArmstrong(int num) {
    int originalNum = num, sum = 0, n = 0;
    int temp = originalNum;
    while (temp != 0) {
        temp /= 10;
        ++n;
    }
    temp = originalNum;
    while (temp != 0) {
        int digit = temp % 10;
        sum += power(digit, n);
        temp /= 10;
    }
    return num == sum;
}

int isPalindrome(int num) {
    int reversed = 0, originalNum = num;
    while (num != 0) {
        int digit = num % 10;
        reversed = reversed * 10 + digit;
        num /= 10;
    }
    return originalNum == reversed;
}