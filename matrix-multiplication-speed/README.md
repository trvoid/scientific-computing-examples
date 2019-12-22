# Matrix multiplication speed

## Example

The example computes real matrix `C = A * B` where `A`, `B`, and `C` are matrices having double precision elements.

* `A`: 2000 rows x 200 columns
* `B`: 200 rows x 1000 columns 
* `C`: 2000 rows x 1000 columns

## System information

* Processor: Intel Core i7-8550U CPU
* RAM: 16.0GB
* OS: Windows 10 (64-bit)
* Power supply: AC adapter

## Result

| Product                           | Compiler | API                | Elapsed time (milliseconds)                                  |
| --------------------------------- | -------- | ------------------ | ------------------------------------------------------------ |
| C                                 | MSVC++   | triple nested loop | * 1194.3                                                     |
| Intel MKL 2019 Update 5           | MSVC++   | cblas_dgemm        | * 15.1 (1 OpenMP intel thread)<br />* 8.5 (4 OpenMP intel threads)<br />* 7.6 (1 TBB thread)<br />* 8.4 (4 TBB threads) |
| MATLAB R2017b (9.3)               |          | * operator         | * 11.9                                                       |
| Python 3.7.2 (Conda distribution) |          | numpy.matmul       | * 18.5                                                       |
| Eigen 3.3.7                       | MSVC++   | * operator         | * 2782.0<br />* 990.0 (with /openmp compiler option)<br />* 35.0 (Using Intel MKL as backend) |
| Dlib 19.19                        | MSVC++   | * operator         | * 4123.0                                                     |

* MSVC++: Version 2019 (16.0)

**Notice:** The result above does not tell you which product is better than the others because I am not sure that I used the best options for each product.

## Links

1. [Eigen](http://eigen.tuxfamily.org/index.php?title=Main_Page)
2. [Intel Math Kernel Library](https://software.intel.com/en-us/mkl)
3. [MATLAB](https://www.mathworks.com/products/matlab.html)
4. [Microsoft Visual Studio](https://visualstudio.microsoft.com/ko/vs/)
5. [Python Anaconda Distribution](https://www.anaconda.com/distribution/)
6. [Dlib](http://dlib.net/)

