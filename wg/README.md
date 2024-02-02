This contains two scripts that can be used to automatically restart WireGuard connections on Windows whenever the connection changes. Sometimes, connections can be disconnected silently and these scripts attempt to fix that problem.

Usage:
1. Install both scripts in C:\Program Files\Wireguard
2. Create a new event in Task Scheduler with the trigger set to the following XML:
```xml
<QueryList>
  <Query Id="0" Path="System">
    <Select Path="Microsoft-Windows-NetworkProfile/Operational">
     *[System[(EventID=10000)]] and *[EventData[(Data[@Name="Description"]!="home-lan-only")]] and *[EventData[(Data[@Name="Name"]!="Identifying...")]]
    </Select>
  </Query>
</QueryList>
```
and the action set to: `wscript`, arguments: `"C:\Program Files\WireGuard\launcher.vbs"`, start in: `C:\Program Files\WireGuard`  
3. Change the variables `home-lan-only` to your WireGuard tunnel name in the PowerShell script and the previous XML.
