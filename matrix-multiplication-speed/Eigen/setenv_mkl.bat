@echo on

REM Intel MKL
set CPRO_PATH=C:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows
set MKLROOT=%CPRO_PATH%\mkl
set REDIST=%CPRO_PATH%\redist

set INCLUDE=%MKLROOT%\include;%INCLUDE%
set LIB=%MKLROOT%\lib\intel64;%CPRO_PATH%\compiler\lib\intel64;%CPRO_PATH%\tbb\lib\intel64\vc_mt;%LIB%
set PATH=%REDIST%\intel64\compiler;%REDIST%\intel64\mkl;%REDIST%\intel64\tbb\vc_mt;%PATH%

REM Eigen
set INCLUDE=C:\DevOpen\eigen-3.3.7;%INCLUDE%

REM MSVC++
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
