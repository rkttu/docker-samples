FROM mcr.microsoft.com/windows/servercore:1903

LABEL Description="Chocolatey Preinstalled Image" Vendor="rkttu.com" OSVersion="1903" SKU="core"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
