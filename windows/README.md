# Prerequisite

`Set-ExecutionPolicy RemoteSigned`

# Install Softwares

using `.\Manage-Software.ps1 list` to list all softwares.

using `.\Manage-Software.ps1 install` to install all softwares.

# Setup

```powershell
.\Setup.ps1 -SoftLinkThisRepoToConfigFolder
.\Setup.ps1 -InstallPSModules
.\Setup.ps1 -SetPSProfile
.\Setup.ps1 -SetEdge
```
