$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False

$TagList = ((Invoke-WebRequest -Uri "https://mcr.microsoft.com/v2/windows/servercore/tags/list").Content | ConvertFrom-Json).tags

$PS_VERSION_LIST = '6.0.0','6.0.1','6.0.2','6.0.3','6.0.4','6.0.5','6.1.0','6.1.1','6.1.2','6.1.3','6.1.4','6.1.5','6.1.6','6.2.0','6.2.1','6.2.2','6.2.3','6.2.4','6.2.5','7.0.0','7.0.1'
$OS_SKU_LIST = 'lstc2016','1607','1709','1803','ltsc2019','1809','1903','1909'

foreach ($PS_VERSION in $PS_VERSION_LIST) {
    foreach ($OS_SKU in $OS_SKU_LIST) {
        $VER_LIST = $TagList | Where-Object { ($_ -clike "${OS_SKU}-*" -or $_ -eq "${OS_SKU}") -and $_ -cnotlike "*-amd64" }
        foreach ($VER in $VER_LIST) {
            $GitHubActionTemplate = @"
name: PowerShell Core CI for ${PS_VERSION}-${VER}

on:
    push:
        branches: [ master ]
    pull_request:
        branches: [ master ]

jobs:

    build-pwsh:
        runs-on: [self-hosted, windows, x64]
        env:
            working-directory: .\pwsh\windows

        steps:
            - name: Checkout
              uses: actions/checkout@v2.1.0
            
            - name: Docker Login
              uses: Azure/docker-login@v1
              with:
                username: rkttu
                password: `${{ secrets.GITHUBKEY }}
                login-server: https://index.docker.io/v1/

            - name: Build the PowerShell Core (${PS_VERISON}-${VER})
              shell: powershell
              env:
                tag: ${PS_VERSION}-nanoserver-${VER}
              working-directory: `${{env.working-directory}}/`${{env.tag}}
              run: |
                docker build . --isolation=hyperv --tag `"rkttu/pwsh:`${env:tag}`";
                docker push `"rkttu/pwsh:`${env:tag}`";
"@;

            $DockerfileTemplate = @"
# escape=``

FROM mcr.microsoft.com/windows/servercore:${VER}  AS installer-env

ARG PS_VERSION=${PS_VERSION}

ARG PS_PACKAGE_URL=https://github.com/PowerShell/PowerShell/releases/download/v`$PS_VERSION/PowerShell-`$PS_VERSION-win-x64.zip

SHELL ["powershell", "-Command", "`$ErrorActionPreference = 'Stop'; `$ProgressPreference = 'SilentlyContinue';"]

RUN if (!(`$env:PS_VERSION -match '^\d+\.\d+\.\d+(-\w+(\.\d+)?)?`$' )) {throw ('PS_Version ({0}) must match the regex "^\d+\.\d+\.\d+(-\w+(\.\d+)?)?`$"' -f `$env:PS_VERSION)}
ADD `${PS_PACKAGE_URL} /powershell.zip

RUN Expand-Archive powershell.zip -DestinationPath \PowerShell

# Install PowerShell into NanoServer
FROM mcr.microsoft.com/windows/nanoserver:${OS_SKU}

ARG VCS_REF="none"
ARG PS_VERSION=6.1.0
ARG IMAGE_NAME=mcr.microsoft.com/powershell

LABEL maintainer="PowerShell Team <powershellteam@hotmail.com>" ``
      readme.md="https://github.com/PowerShell/PowerShell/blob/master/docker/README.md" ``
      description="This Dockerfile will install the latest release of PowerShell." ``
      org.label-schema.usage="https://github.com/PowerShell/PowerShell/tree/master/docker#run-the-docker-image-you-built" ``
      org.label-schema.url="https://github.com/PowerShell/PowerShell/blob/master/docker/README.md" ``
      org.label-schema.vcs-url="https://github.com/PowerShell/PowerShell-Docker" ``
      org.label-schema.name="powershell" ``
      org.label-schema.vcs-ref=`${VCS_REF} ``
      org.label-schema.vendor="PowerShell" ``
      org.label-schema.version=`${PS_VERSION} ``
      org.label-schema.schema-version="1.0" ``
      org.label-schema.docker.cmd="docker run `${IMAGE_NAME} pwsh -c '`$psversiontable'" ``
      org.label-schema.docker.cmd.devel="docker run `${IMAGE_NAME}" ``
      org.label-schema.docker.cmd.test="docker run `${IMAGE_NAME} pwsh -c Invoke-Pester" ``
      org.label-schema.docker.cmd.help="docker run `${IMAGE_NAME} pwsh -c Get-Help"

# Copy PowerShell Core from the installer container
ENV ProgramFiles C:\Program Files
COPY --from=installer-env ["\\PowerShell\\", "`$ProgramFiles\\PowerShell"]

# Persist %PSCORE% ENV variable for user convenience
ENV PSCORE="`$ProgramFiles\PowerShell\pwsh.exe"

# Set the path
ENV PATH="`$PATH;`$ProgramFiles\PowerShell"

CMD ["pwsh.exe"]
"@;
            $TARGET_PATH = "./.github/workflows"
            New-Item -Type Directory -Path $TARGET_PATH -Force
            [System.IO.File]::WriteAllLines("${TARGET_PATH}/pwsh-windows-${PS_VERSION}-${VER}.yml", $GitHubActionTemplate, $Utf8NoBomEncoding)

            $TARGET_PATH = "./pwsh/windows/${PS_VERSION}-nanoserver-${VER}"
            New-Item -Type Directory -Path $TARGET_PATH -Force
            [System.IO.File]::WriteAllLines("${TARGET_PATH}/Dockerfile", $DockerfileTemplate, $Utf8NoBomEncoding)
        }
    }
}
