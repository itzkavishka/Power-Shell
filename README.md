# Power-Shell
Power-Shell Customizations.

# PowerShell Profile Customizations

This repository contains customizations and enhancements for PowerShell profiles aimed at improving command-line productivity and workflow efficiency.

## Features

- **Terminal Customization:** Includes themes and configurations for enhancing the appearance of PowerShell terminals using oh-my-posh and Terminal-Icons modules.
- **Admin Check and Prompt Customization:** Dynamically adjusts the prompt based on whether the current session has administrator privileges.
- **Utility Functions and Aliases:** Provides a comprehensive set of utility functions and aliases for common tasks such as file management, process handling, Git operations, and system administration.
- **Enhanced PowerShell Experience:** Configures PSReadLine options for improved command-line editing and navigation.

## Setup

### Install Terminal-Icons Module

Ensure the Terminal-Icons module is installed using the following command:

```powershell
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
```

### Install oh-my-posh

Ensure oh-my-posh is installed using the following command:

```powershell
Install-Module -Name oh-my-posh -Scope CurrentUser -Force -SkipPublisherCheck
```

## Usage
Clone this repository to your local machine and integrate the customizations into your PowerShell environment. Modify and extend the profile according to your specific needs and preferences.

Feel free to contribute improvements or suggest new features by creating issues or pull requests!

## Credits
This project was inspired by and includes initial setup ideas from [ChrisTitusTech](https://github.com/ChrisTitusTech), whose setup script (setup.ps1) provided foundational configurations.

## External Links 
> [OH My Posh](https://ohmyposh.dev/docs/installation/windows)
---
> [Nerd Fonts](https://www.nerdfonts.com/)
---
> [Terminal-Icons](https://github.com/devblackops/Terminal-Icons)
