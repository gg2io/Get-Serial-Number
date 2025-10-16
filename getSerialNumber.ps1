# Prompt for Site Code
$siteCode = Read-Host -Prompt "Enter Site Code"

# Define the properties to select
$odataProperties = @(
    "Agent_SiteCode",
    "Agent_CertificateSubject",
    "Agent_Win32_ComputerSystem_Name",
    "Agent_Win32_BaseBoard_SerialNumber",
    "Agent_Win32_ComputerSystem_UserName"
)

# Build the filter string
$odataFilter = "Agent_SiteCode eq '$siteCode'"

# Query agent status
$agentStatus = Get-AgentStatusValue -Filter $odataFilter -Select $odataProperties

if ($null -ne $agentStatus) {
    # Only keep computers with names starting with "L"
    $filteredAgents = $agentStatus | Where-Object { $_.Agent_Win32_ComputerSystem_Name -like "L*" }

    foreach ($agent in $filteredAgents) {
        $certSubject = $agent.Agent_CertificateSubject
        $compName    = $agent.Agent_Win32_ComputerSystem_Name
        $serialNum   = $agent.Agent_Win32_BaseBoard_SerialNumber
        $userName    = $agent.Agent_Win32_ComputerSystem_UserName

        # Split on "/" and grab the first non-empty segment (Service Tag)
        $parts = $serialNum -split "/"
        if ($parts.Count -ge 2) {
            $serviceTag = $parts[1]
        } else {
            $serviceTag = "N/A"
        }

        Write-Host "Computer Name: $compName" -ForegroundColor Cyan
        Write-Host "Assigned User: $userName" -ForegroundColor Red
        Write-Host "Motherboard Serial: $serialNum" -ForegroundColor Yellow
        Write-Host "Service Tag: $serviceTag" -ForegroundColor Green
        Write-Host "---------------------------------------------"
    }
}