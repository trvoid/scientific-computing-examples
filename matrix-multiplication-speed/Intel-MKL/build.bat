@echo on

set DLL_SUFF=
set THREADING=sequential
set EXAMPLE=matrix_multiplication

set LINK_OPTION=

:ParseArgs
if /i "%1"==""                                                                goto Build
if /i "%1"=="static"                            (set DLL_SUFF=)     & shift & goto ParseArgs
if /i "%1"=="dynamic"                           (set DLL_SUFF=_dll) & shift & goto ParseArgs
if /i "%1"=="sequential"                        (set THREADING=%1)  & shift & goto ParseArgs
if /i "%1"=="intel_thread"                      (set THREADING=%1)  & shift & goto ParseArgs
if /i "%1"=="tbb_thread"                        (set THREADING=%1)  & shift & goto ParseArgs
if /i "%1"=="matrix_multiplication"             (set EXAMPLE=%1)    & shift & goto ParseArgs
if /i "%1"=="dgemm_example"                     (set EXAMPLE=%1)    & shift & goto ParseArgs
if /i "%1"=="dgemm_with_timing"                 (set EXAMPLE=%1)    & shift & goto ParseArgs
if /i "%1"=="dgemm_threading_effect_example"    (set EXAMPLE=%1)    & shift & goto ParseArgs

:Build
set OUTPUT_FOLDER=_results\%EXAMPLE%_%THREADING%%DLL_SUFF%
if not exist "_results" (mkdir "_results" 2>nul)
if not exist "%OUTPUT_FOLDER%" (mkdir "%OUTPUT_FOLDER%" 2>nul)

set LIBS=mkl_intel_lp64%DLL_SUFF%.lib mkl_core%DLL_SUFF%.lib mkl_%THREADING%%DLL_SUFF%.lib

if "%THREADING%"=="intel_thread" (
    set LINK_OPTION=/MT
    set LIBS=%LIBS% libiomp5md.lib
)
if "%THREADING%"=="tbb_thread" (
    set LINK_OPTION=/MT
    set LIBS=%LIBS% tbb.lib
)

cl.exe %LINK_OPTION% %LIBS% /Fo%OUTPUT_FOLDER%\%EXAMPLE%.obj /Fe%OUTPUT_FOLDER%\%EXAMPLE%.exe src\%EXAMPLE%.c
