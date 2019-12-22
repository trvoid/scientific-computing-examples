@echo off

set CPRO_PATH=C:\Program Files (x86)\IntelSWTools\compilers_and_libraries\windows
set MKLROOT=%CPRO_PATH%\mkl
set REDIST=%CPRO_PATH%\redist

set INCLUDE=%MKLROOT%\include;%INCLUDE%

set LIB=%MKLROOT%\lib\intel64;%LIB%
set PATH=%REDIST%\intel64\mkl;%PATH%

REM for OpenMP intel thread
set LIB=%CPRO_PATH%\compiler\lib\intel64;%LIB%
set PATH=%REDIST%\intel64\compiler;%PATH%

REM for TBB thread
set LIB=%CPRO_PATH%\tbb\lib\intel64\vc_mt;%LIB%
set PATH=%REDIST%\intel64\tbb\vc_mt;%PATH%

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" amd64
