@echo on

set OUTPUT_FOLDER=_results
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

REM Using Intel MKL
set OUTPUT_FOLDER=_results\matrix_multiplication_mkl
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

set LIBS=mkl_intel_lp64.lib mkl_core.lib mkl_sequential.lib

cl.exe /DEIGEN_USE_MKL_ALL /EHsc /Fo%OUTPUT_FOLDER%\matrix_multiplication.obj /Fe%OUTPUT_FOLDER%\matrix_multiplication.exe %LIBS% matrix_multiplication.cpp
