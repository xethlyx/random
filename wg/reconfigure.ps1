$router = "192.168.1.1"
$tunnelName = "home-lan-only"

if (Test-Connection -ComputerName $router -Count 1 -Quiet) {
    Write-Host "Connection stable."
    Exit 0
}

$service = Get-Service -Name "WireGuardTunnel`$$tunnelName" -ErrorAction SilentlyContinue
if ($service -eq $null) {
    Write-Host "Tunnel not found.. creating.."
    & "C:\Program Files\WireGuard\wireguard.exe" /installtunnelservice "C:\Program Files\WireGuard\Data\Configurations\$tunnelName.conf.dpapi"
    Exit 0
}

Write-Host "Restarting tunnel.."
Restart-Service -Name "WireGuardTunnel`$$tunnelName"
