@echo on

set OUTPUT_FOLDER=_results
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

REM Simple compilation
set OUTPUT_FOLDER=_results\matrix_multiplication
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

cl.exe /EHsc /Fo%OUTPUT_FOLDER%\matrix_multiplication.obj /Fe%OUTPUT_FOLDER%\matrix_multiplication.exe matrix_multiplication.cpp

REM With /openmp compiler option
set OUTPUT_FOLDER=_results\matrix_multiplication_openmp
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

cl.exe /openmp /EHsc /Fo%OUTPUT_FOLDER%\matrix_multiplication.obj /Fe%OUTPUT_FOLDER%\matrix_multiplication.exe matrix_multiplication.cpp
