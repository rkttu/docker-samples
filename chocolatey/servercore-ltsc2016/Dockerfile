FROM mcr.microsoft.com/windows/servercore:ltsc2016

LABEL Description="Chocolatey Preinstalled Image" Vendor="rkttu.com" OSVersion="ltsc2016" SKU="core"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]

RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
