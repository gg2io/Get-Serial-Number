# getSerialNumber.ps1

[![PowerShell](https://img.shields.io/badge/PowerShell-5.1+-blue?logo=powershell&logoColor=white)](https://learn.microsoft.com/en-us/powershell/)

## Overview
This PowerShell script retrieves the serial number and service tag of computers per site group.

It’s useful for internal IT inventory, hardware tracking, and support automation.

---

## Requirements
- Windows PowerShell 3.0 or newer  
- Windows 7 / Server 2008 or later  
- Administrative rights

---

## Usage

### Local system
```powershell
.\getSerialNumber.ps1
```
---

## Example Output
```
Computer Name : DESKTOP-12345
Assigned User : Domain\Example.User
Motherboard Serial : ABCD123
Service Tag   : ABCD123
```

---