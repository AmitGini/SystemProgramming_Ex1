#include <stdio.h>
#include "NumClass.h"

int main() {

    int x,y;
    
    scanf("%d", &x);
    scanf("%d", &y);

    int i = x < y ? x : y;
    int j = x > y ? x : y; 
    
    int counter = 0;
    
    printf("The Armstrong numbers are:");
    while(i+counter <= j){
        if (isArmstrong(i+counter)) {
            printf(" %d", i+counter);
        }
        ++counter;
    }

    counter = 0;
    printf("\nThe Palindromes are:");
    while(i+counter <= j){
        if (isPalindrome(i+counter)) {
            printf(" %d", i+counter);
        }
            ++counter;
    }

    counter = 0;
    printf("\nThe Prime numbers are:");
    while(i+counter <= j){
        if (isPrime(i+counter)) {
            printf(" %d", i+counter);
        }
            ++counter;
    }

    counter = 0;
    printf("\nThe Strong numbers are:");
    while(i+counter <= j){
        if (isStrong(i+counter)) {
            printf(" %d", i+counter);
        }
            ++counter;
    }

    return 0;
}
