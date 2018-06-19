@echo off
pushd "%~dp0"

set OWNER=rkttu
set IMAGE=rabbitmq-windows
echo Building `%OWNER%/%IMAGE%` variations:

for /d %%t in ("*") do (
  echo Building `%OWNER%/%IMAGE%:%%t` image:
  echo.
  docker build -t %OWNER%/%IMAGE%:%%t %%t
)

:exit
popd
@echo on