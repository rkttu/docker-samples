@echo off
pushd "%~dp0"

docker pull mcr.microsoft.com/windows/nanoserver:sac2016
docker pull mcr.microsoft.com/windows/nanoserver:1709
docker pull mcr.microsoft.com/windows/nanoserver:1803
docker pull mcr.microsoft.com/windows/nanoserver:1809
docker pull mcr.microsoft.com/windows/nanoserver:1903

docker pull mcr.microsoft.com/windows/servercore:ltsc2016
docker pull mcr.microsoft.com/windows/servercore:1709
docker pull mcr.microsoft.com/windows/servercore:1803
docker pull mcr.microsoft.com/windows/servercore:1809
docker pull mcr.microsoft.com/windows/servercore:ltsc2019
docker pull mcr.microsoft.com/windows/servercore:1903

docker pull mcr.microsoft.com/windows:1809
docker pull mcr.microsoft.com/windows:1903

:exit
popd
@echo on