param(
  [switch]$SoftLinkThisRepoToConfigFolder,
  [switch]$InstallPSModules,
  [switch]$SetPSProfile,
  [switch]$SetEdge
)

if ($SoftLinkThisRepoToConfigFolder) {
  New-Item -ItemType SymbolicLink -Target "$PSScriptRoot\..\"  -Path "$env:USERPROFILE\.config\"
}

if ($InstallPSModules) {
  Install-Module -Name z -Force
  Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
}

if ($SetPSProfile) {
  Set-Content -Path $PROFILE.CurrentUserCurrentHost -Value '. $env:USERPROFILE\.config\powershell\user_profile.ps1'  
}

if ($SetEdge) {
  Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "AltTabSettings" -Type DWORD -Value 0
}
