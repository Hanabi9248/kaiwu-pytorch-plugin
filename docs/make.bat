@ECHO OFF
setlocal

pushd "%~dp0"

REM Command file for Sphinx documentation

if not defined SPHINXBUILD set "SPHINXBUILD=sphinx-build"
set "SPHINXBUILD_PATH=%SPHINXBUILD:"=%"
set "SPHINXBUILD_COMMAND=%SPHINXBUILD%"
if exist "%SPHINXBUILD_PATH%" set SPHINXBUILD_COMMAND="%SPHINXBUILD_PATH%"
set SOURCEDIR=.
set BUILDDIR=_build

call %SPHINXBUILD_COMMAND% >NUL 2>NUL
if errorlevel 9009 goto missing

if "%1" == "" goto help

call %SPHINXBUILD_COMMAND% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
set "SPHINXBUILD_STATUS=%ERRORLEVEL%"
goto return

:help
call %SPHINXBUILD_COMMAND% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
set "SPHINXBUILD_STATUS=%ERRORLEVEL%"
goto return

:missing
echo.
echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
echo.installed, then set the SPHINXBUILD environment variable to point
echo.to the full path of the 'sphinx-build' executable. Alternatively you
echo.may add the Sphinx directory to PATH.
echo.
echo.If you don't have Sphinx installed, grab it from
echo.https://www.sphinx-doc.org/
set "SPHINXBUILD_STATUS=1"

:return
popd
exit /b %SPHINXBUILD_STATUS%
