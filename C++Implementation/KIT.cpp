#include <stdio.h>
#include <math.h>
#include <iostream>

// Get size of the numbers
int getSize(long num)
{
    int count = 0;
    while (num > 0)
    {
        count++;
        num /= 10;
    }
    return count;
}

long karatsuba(long X, long Y)
{
    // Base Case
    if (X < 10 && Y < 10)
        return X * Y;

    int n = 0;
    long p = 0;

    long a = 0;
    long b = 0;
    long c = 0;
    long d = 0;

    long ac = 0;
    long bd = 0;
    long e = 0;

    while (X >= 10 && Y >= 10)
    {
        // determine the size of X and Y
        int size = fmax(getSize(X), getSize(Y));

        // Split X and Y
        n = (int)ceil(size / 2.0);
        p = (long)pow(10, n);

        a = (long)floor(X / (double)p);
        b = X % p;
        c = (long)floor(Y / (double)p);
        d = Y % p;

        // Recur until exit loop
        ac = a * c;
        bd = b * d;
        e = (a + b) * (c + d) - ac - bd;
    }
    // return the equation
    return (long)(pow(10 * 1L, 2 * n) * ac + pow(10 * 1L, n) * e + bd);
}

int main()
{

    int R1 = 4;
    int C1 = 4;
    int R2 = 4;
    int C2 = 1;

    int matA[4][4] = {1, 1, 1, 1,
                      1, 1, 1, 1,
                      1, 1, 1, 1,
                      1, 1, 1, 1};
    int matB[4][1] = {1,
                      1,
                      1,
                      1};
    int matC[4][1] = {1,
                      1,
                      1,
                      1};
    int matD[4][4] = {0,
                      0,
                      0,
                      0};

    /*Matrix Multiplication w/Printing*/
    for (int i = 0; i < R1; i++)
    {
        for (int j = 0; j < C2; j++)
        {
            for (int k = 0; k < R2; k++)
            {
                matD[i][j] += karatsuba(matA[i][k], matB[k][j]);
            }
            // std::cout << matD[i][j] << "\n";
        }
    }

    /*Matrix Addition w/Printing*/
    for (int i = 0; i < R1; i++)
    {
        for (int j = 0; j < C2; j++)
        {
            matD[i][j] = matD[i][j] + matC[i][j];
            std::cout << matD[i][j] << "\n";
        }
    }
}