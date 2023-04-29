$SoftwareMap = @{
    "PowerShell" = "Microsoft.PowerShell";
    "Python 3.10" = "Python.Python.3.10";
    "Git" = "Git.Git";
    "Starship" = "Starship.Starship";
    "VSCode" = "Microsoft.VisualStudioCode";
    "WeChat" = "Tencent.WeChat";
    "Steam" = "Valve.Steam";
    "Snipaste" = "9P1WXPKB68KX";
}

function List {
    $softwareList = @()

    $totalSoftwareCount = $SoftwareMap.Count
    $softwareCount = 0

    Write-Progress -Activity "Loading software list" -Status "Please wait..." -PercentComplete 0

    $SoftwareMap.GetEnumerator() | ForEach-Object {
        $name = $_.Key
        $id = $_.Value
        
        $installed = winget list | Select-String $id
        if ($installed) {
            $status = "Installed"
        } else {
            $status = "Uninstalled"
        }

        $softwareList += [PSCustomObject] @{
            Name = $name
            Id = $id
            Status = $status
        }

        $softwareCount++
        $percentComplete = ($softwareCount / $totalSoftwareCount) * 100
        Write-Progress -Activity "Loading software list" -Status "Please wait..." -PercentComplete $percentComplete
    }

    Write-Progress -Activity "Loading software list" -Status "Completed!" -Completed

    $installedSoftwareList = $softwareList | Where-Object {$_.Status -eq "Installed"}
    $uninstalledSoftwareList = $softwareList | Where-Object {$_.Status -eq "Uninstalled"}

    Write-Host "Installed software:"
    $installedSoftwareList | Select-Object Name, Id | Format-Table -AutoSize

    Write-Host "Uninstalled software:"
    $uninstalledSoftwareList | Select-Object Name, Id | Format-Table -AutoSize
}

function Install {
    param (
        [string]$name
    )
    if ($name) {
        $id = $SoftwareMap[$name]
        if (!$id) {
            Write-Host "Unknown software name: $name"
            return
        }
        winget install --id $id -e
        Write-Host "$name installed"
    } else {
        Write-Host "Installing all software..."
        $SoftwareMap.GetEnumerator() | ForEach-Object {
            winget install $_.Value -e
            Write-Host "$($_.Key) installed"
        }
    }
}

$Command = $args[0]
if (!$Command) {
    Write-Host "Available commands: list, install"
    return
}

switch ($Command) {
    "list" { List }
    "install" { Install $args[1] }
    default { Write-Host "Unknown command: $Command" }
}
