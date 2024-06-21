### PowerShell Profile Refactor
### Version 1.04 - Cleaned Up

# Ensure Terminal-Icons module is installed
if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
}
Import-Module -Name Terminal-Icons

# Admin Check and Prompt Customization
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
function prompt {
    if ($isAdmin) { "[" + (Get-Location) + "] # " } else { "[" + (Get-Location) + "] $ " }
}
$adminSuffix = if ($isAdmin) { " [ADMIN]" } else { "" }
$Host.UI.RawUI.WindowTitle = "PowerShell $($PSVersionTable.PSVersion) $adminSuffix"

# Edit the profile
function Edit-Profile {
    code $PROFILE.CurrentUserAllHosts
}

# Network Utilities
function Get-PubIP {
    (Invoke-WebRequest http://ifconfig.me/ip).Content
}

# System Utilities
function uptime {
    if ($PSVersionTable.PSVersion.Major -eq 5) {
        Get-WmiObject Win32_OperatingSystem | Select-Object @{Name='LastBootUpTime'; Expression={$_.ConvertToDateTime($_.LastBootUpTime)}} | Format-Table -HideTableHeaders
    } else {
        net statistics workstation | Select-String "since" | ForEach-Object { $_.ToString().Replace('Statistics since ', '') }
    }
}

function reload-profile {
    & $profile
}

function unzip($file) {
    Write-Output ("Extracting $file to $pwd")
    $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}

function grep($regex, $dir = $null) {
    if ($dir) {
        Get-ChildItem $dir | Select-String $regex
    } else {
        $input | Select-String $regex
    }
}

function df {
    Get-Volume
}

function sed($file, $find, $replace) {
    (Get-Content $file) -replace [regex]::Escape($find), $replace | Set-Content $file
}

function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

function export($name, $value) {
    Set-Item -Force -Path "env:$name" -Value $value
}

function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

function pgrep($name) {
    Get-Process $name
}

function head($Path, $n = 10) {
    Get-Content $Path -Head $n
}

function tail($Path, $n = 10) {
    Get-Content $Path -Tail $n
}

# Quick File Creation
function nf($name) {
    New-Item -ItemType "file" -Path . -Name $name
}

# Directory Management
function mkcd($dir) {
    mkdir $dir -Force
    Set-Location $dir
}

### Quality of Life Aliases

# Navigation Shortcuts
function docs {
    Set-Location -Path $HOME\Documents
}

function downs {
    Set-Location -Path $HOME\Downloads
}

function dtop {
    Set-Location -Path $HOME\Desktop
}

function odowns {
    explorer $HOME\Downloads
}

function odocs {
    explorer $HOME\Documents
}

# Quick Access to Editing the Profile
function ep {
    code $PROFILE
}

# Simplified Process Management
function k9($ProcessName) {
    Stop-Process -Name $ProcessName
}

# Enhanced Listing
function la {
    Get-ChildItem -Path . -Force | Format-Table -AutoSize
}

function ll {
    Get-ChildItem -Path . -Force -Hidden | Format-Table -AutoSize
}

# Git Shortcuts
function gs {
    git status
}

function ga {
    git add .
}

function gc($message) {
    git commit -m $message
}

function gp {
    git push
}

function g {
    z Github
}

function gcom {
    git add .
    git commit -m $args
}

function lazyg {
    git add .
    git commit -m $args
    git push
}

# Quick Access to System Information
function sysinfo {
    Get-ComputerInfo
}

# Networking Utilities
function flushdns {
    Clear-DnsClientCache
}

# Clipboard Utilities
function cpy($text) {
    Set-Clipboard $text
}

function pst {
    Get-Clipboard
}

# Enhanced PowerShell Experience
Set-PSReadLineOption -Colors @{
    Command = 'Yellow'
    Parameter = 'Green'
    String = 'DarkCyan'
}

