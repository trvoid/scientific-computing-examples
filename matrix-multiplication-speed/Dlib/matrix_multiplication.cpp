#include <iostream>
#include <chrono>
#include <dlib/matrix.h>

using namespace dlib;
using namespace std;

#define LOOP_COUNT 10

int main()
{
    int m = 2000;
    int p = 200;
    int n = 1000;
    
    matrix<double> A(m,p);
    matrix<double> B(p,n);
    
    for (int i = 0; i < m; i++)
    {
        for (int j = 0; j < p; j++)
        {
            A(i, j) = i * p + j + 1;
        }
    }
    for (int i = 0; i < p; i++)
    {
        for (int j = 0; j < n; j++)
        {
            B(i, j) = -(i * n + j) - 1;
        }
    }
    
    cout << "Making the first run of matrix product using the * operator" << endl;
    cout << "to get stable run time measurements." << endl << endl;
    matrix<double> C = A * B;
    
    cout << "Measuring performance of matrix product using the * operator." << endl << endl;
    auto start = chrono::steady_clock::now();
    for (int i = 0; i < LOOP_COUNT;i++)
    {
        C = A * B;
    }
    auto end = chrono::steady_clock::now();
    double elapsed_time = chrono::duration_cast<chrono::milliseconds>(end -start).count() / LOOP_COUNT;
    cout << "Elapsed time: " << elapsed_time << " milliseconds." << endl;
}
