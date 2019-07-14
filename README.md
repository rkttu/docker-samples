# docker-samples (with Latest Windows Server/PowerShell support)

Repository containing Redis and RabbitMQ docker samples with Latest Windows Server/PowerShell support. This Git repository is a forked version of [`micdenny/docker-samples`](https://github.com/micdenny/docker-samples) repository.

## Docker Hub URL

I uploaded the images built with the `Dockerfile`s of this Git repository to the Docker Hub repository below.

- [RabbitMQ Windows Repo](https://hub.docker.com/r/rkttu/rabbitmq-windows)
- [Redis Windows Repo](https://hub.docker.com/r/rkttu/redis-windows)
- [Chocolatey Windows Repo](https://hub.docker.com/r/rkttu/chocolatey)
- [PowerShell 6.1.0 Windows Nano Server Repo](https://hub.docker.com/r/rkttu/pwsh)

## Available docker images

Select the version of the tag that matches your Docker host operating system to get the image. If you are using a version of the tag that is lower than the version of the host operating system, or you are running a Windows container in Windows 10, you must use a Hyper-V container based on Processor virtualization.

### RabbitMQ 3.6.12

- **Windows Server 2016**
  - `rkttu/rabbitmq-windows:3.6.12-ltsc2016`
- **Windows Server 1709**
  - `rkttu/rabbitmq-windows:3.6.12-1709`
- **Windows Server 1803**
  - `rkttu/rabbitmq-windows:3.6.12-1803`
- **Windows Server 2019 (1809)**
  - `rkttu/rabbitmq-windows:3.6.12-ltsc2019`
  - `rkttu/rabbitmq-windows:3.6.12-1809`
- **Windows Server 1903**
  - `rkttu/rabbitmq-windows:3.6.12-1903`

### RabbitMQ 3.6.9

- **Windows Server 2016**
  - `rkttu/rabbitmq-windows:3.6.9-ltsc2016`
- **Windows Server 1709**
  - `rkttu/rabbitmq-windows:3.6.9-1709`
- **Windows Server 1803**
  - `rkttu/rabbitmq-windows:3.6.9-1803`
- **Windows Server 2019 (1809)**
  - `rkttu/rabbitmq-windows:3.6.9-2019`
  - `rkttu/rabbitmq-windows:3.6.9-1809`
- **Windows Server 1903**
  - `rkttu/rabbitmq-windows:3.6.9-1903`

### Redis 3.2

- **Windows Server 2016**
  - `rkttu/redis-windows:3.2-sac2016`
- **Windows Server 1709**
  - `rkttu/redis-windows:3.2-1709`
- **Windows Server 1803**
  - `rkttu/redis-windows:3.2-1803`
- **Windows Server 2019 (1809)**
  - `rkttu/redis-windows:3.2-1809`
- **Windows Server 1903**
  - `rkttu/redis-windows:3.2-1903`

### Redis 3.0

- **Windows Server 2016**
  - `rkttu/redis-windows:3.0-sac2016`
- **Windows Server 1709**
  - `rkttu/redis-windows:3.0-1709`
- **Windows Server 1803**
  - `rkttu/redis-windows:3.0-1803`
- **Windows Server 2019 (1809)**
  - `rkttu/redis-windows:3.0-1809`
- **Windows Server 1903**
  - `rkttu/redis-windows:3.0-1903`

### Redis 2.8

- **Windows-Server 2016**
  - `rkttu/redis-windows:2.8-sac2016`
- **Windows-Server 1709**
  - `rkttu/redis-windows:2.8-1709`
- **Windows-Server 1803**
  - `rkttu/redis-windows:2.8-1803`
- **Windows-Server 2019 (1809)**
  - `rkttu/redis-windows:2.8-1809`
- **Windows-Server 1903**
  - `rkttu/redis-windows:2.8-1903`

### Chocolatey

- **Windows-Server 2016 Core**
  - `rkttu/chocolatey:servercore-ltsc2016`
- **Windows-Server 1709 Core**
  - `rkttu/chocolatey:servercore-1709`
- **Windows-Server 1803 Core**
  - `rkttu/chocolatey:servercore-1803`
- **Windows-Server 2019 (1809) Core**
  - `rkttu/chocolatey:servercore-1809`
  - `rkttu/chocolatey:servercore-ltsc2019`
- **Windows Full (1809)**
  - `rkttu/chocolatey:full-1809`
- **Windows Full (1903)**
  - `rkttu/chocolatey:full-1903`

### PowerShell Core 6.1.0

- **PowerShell Core 6.1.0 for Windows Server 1809 Nano**
  - `rkttu/pwsh:6.1.0-nanoserver-1809`
- **PowerShell Core 6.1.0 for Windows Server 1903 Nano**
  - `rkttu/pwsh:6.1.0-nanoserver-1903`
