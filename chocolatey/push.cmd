@echo off
pushd "%~dp0"

set OWNER=rkttu
set IMAGE=chocolatey
echo Pushing `%OWNER%/%IMAGE%` variations:

for /d %%t in ("*") do (
  echo Pushing `%OWNER%/%IMAGE%:%%t` image:
  echo.
  docker push %OWNER%/%IMAGE%:%%t
)

:exit
popd
@echo on