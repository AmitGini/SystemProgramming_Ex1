#include "NumClass.h"

int isPrime(int num) {
    if (num <= 1) return 0;
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) return 0;
    }
    return 1;
}

int isStrong(int num) {
    if (num <= 0) return 0;

    int sum = 0, originalNum = num;
    while (num > 0) {
        int digit = num % 10;
        int factorial = 1;
        for (int i = 2; i <= digit; i++) {
            factorial *= i;
        }
        sum += factorial;
        num /= 10;
    }
    return sum == originalNum;
}