# Used from https://stackoverflow.com/a/31602095 because it preserves the working directory!
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
# Your script here

Import-Module -DisableNameChecking $PSScriptRoot\lib\count-x-seconds.psm1
Write-Output "Original Folder $PSScriptRoot"
Write-Output ""
Push-Location $PSScriptRoot
Function UnrestrictPermissions {
    Set-ExecutionPolicy Unrestricted -Force -Scope Process
    Set-ExecutionPolicy Unrestricted -Force -Scope CurrentUser
    Set-ExecutionPolicy Unrestricted -Force -Scope LocalMachine
    Get-ExecutionPolicy -List
    Write-Output ""
}

Function RestrictPermissions {
    Set-ExecutionPolicy Restricted -Force -Scope Process
    Set-ExecutionPolicy Restricted -Force -Scope CurrentUser
    Set-ExecutionPolicy Restricted -Force -Scope LocalMachine
    Get-ExecutionPolicy -List
    Write-Output ""
}

Function RunScripts {
    Push-Location .\scripts
    
        Clear-Host
        Write-Output "=========================================================================================" "backup-system.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"backup-system.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "all-in-one-tweaks.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"all-in-one-tweaks.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "block-telemetry.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"block-telemetry.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "disable-services.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"disable-services.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "fix-privacy-settings.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"fix-privacy-settings.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "optimize-user-interface.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"optimize-user-interface.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "optimize-windows-update.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"optimize-windows-update.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "remove-default-apps.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"remove-default-apps.ps1"
        Clear-Host
        Write-Output "=========================================================================================" "remove-onedrive.ps1"
        #PowerShell -NoProfile -ExecutionPolicy Bypass -file 
        .\"remove-onedrive.ps1"
          
    Pop-Location
}


Push-Location .\lib
    PowerShell -NoProfile -ExecutionPolicy Unrestricted -file .\"config-cmd-window.ps1"
Pop-Location

Clear-Host
Write-Output "========================================================================================="
Write-Output "      Improve and Optimize Windows 10 (Made by Plínio Larrubia A.K.A. LeDragoX)"
Write-Output "========================================================================================="
Write-Output ""


UnrestrictPermissions
Write-Output ""
RunScripts
Write-Output ""

RestrictPermissions
CountXseconds