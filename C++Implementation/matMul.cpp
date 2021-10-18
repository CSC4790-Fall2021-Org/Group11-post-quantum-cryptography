#include <iostream>

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
                matD[i][j] += matA[i][k] * matB[k][j];
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