# PSReadLine
Import-Module PSReadLine

# Alias
Set-Alias ll ls

Set-Alias k kubectl

# Git Alias
Function GitStatus {git status}
Set-Alias gs GitStatus
Function GitLog {git log}
Set-Alias glo GitLog

# Starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$env:USERPROFILE\.config\starship\starship.toml"
