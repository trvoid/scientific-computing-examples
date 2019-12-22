@echo on

set OUTPUT_FOLDER=_results
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

REM Simple compilation
set OUTPUT_FOLDER=_results\matrix_multiplication
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

cl.exe /c /EHsc /Fo%OUTPUT_FOLDER%\source.obj C:\DevOpen\dlib-19.19\dlib\all\source.cpp
cl.exe /c /EHsc /Fo%OUTPUT_FOLDER%\matrix_multiplication.obj matrix_multiplication.cpp
cl.exe /Fe%OUTPUT_FOLDER%\matrix_multiplication.exe %OUTPUT_FOLDER%\source.obj %OUTPUT_FOLDER%\matrix_multiplication.obj
