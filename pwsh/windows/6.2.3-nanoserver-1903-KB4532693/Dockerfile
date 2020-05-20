# escape=`

FROM mcr.microsoft.com/windows/servercore:1903-KB4532693  AS installer-env

ARG PS_VERSION=6.2.3

ARG PS_PACKAGE_URL=https://github.com/PowerShell/PowerShell/releases/download/v$PS_VERSION/PowerShell-$PS_VERSION-win-x64.zip

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN if (!($env:PS_VERSION -match '^\d+\.\d+\.\d+(-\w+(\.\d+)?)?$' )) {throw ('PS_Version ({0}) must match the regex "^\d+\.\d+\.\d+(-\w+(\.\d+)?)?$"' -f $env:PS_VERSION)}
ADD ${PS_PACKAGE_URL} /powershell.zip

RUN Expand-Archive powershell.zip -DestinationPath \PowerShell

# Install PowerShell into NanoServer
FROM mcr.microsoft.com/windows/nanoserver:1903

ARG VCS_REF="none"
ARG PS_VERSION=6.1.0
ARG IMAGE_NAME=mcr.microsoft.com/powershell

LABEL maintainer="PowerShell Team <powershellteam@hotmail.com>" `
      readme.md="https://github.com/PowerShell/PowerShell/blob/master/docker/README.md" `
      description="This Dockerfile will install the latest release of PowerShell." `
      org.label-schema.usage="https://github.com/PowerShell/PowerShell/tree/master/docker#run-the-docker-image-you-built" `
      org.label-schema.url="https://github.com/PowerShell/PowerShell/blob/master/docker/README.md" `
      org.label-schema.vcs-url="https://github.com/PowerShell/PowerShell-Docker" `
      org.label-schema.name="powershell" `
      org.label-schema.vcs-ref=${VCS_REF} `
      org.label-schema.vendor="PowerShell" `
      org.label-schema.version=${PS_VERSION} `
      org.label-schema.schema-version="1.0" `
      org.label-schema.docker.cmd="docker run ${IMAGE_NAME} pwsh -c '$psversiontable'" `
      org.label-schema.docker.cmd.devel="docker run ${IMAGE_NAME}" `
      org.label-schema.docker.cmd.test="docker run ${IMAGE_NAME} pwsh -c Invoke-Pester" `
      org.label-schema.docker.cmd.help="docker run ${IMAGE_NAME} pwsh -c Get-Help"

# Copy PowerShell Core from the installer container
ENV ProgramFiles C:\Program Files
COPY --from=installer-env ["\\PowerShell\\", "$ProgramFiles\\PowerShell"]

# Persist %PSCORE% ENV variable for user convenience
ENV PSCORE="$ProgramFiles\PowerShell\pwsh.exe"

# Set the path
ENV PATH="$PATH;$ProgramFiles\PowerShell"

CMD ["pwsh.exe"]
