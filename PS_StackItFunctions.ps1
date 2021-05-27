# Stackit / CloudFoundry functions
function Start-SessionCfTunnel {
    Start-CFTunnel -RemoteHost $StackItSessionDbRemoteHost    
}

function Start-ServiceDiscoveryCfTunnel {
    Start-CFTunnel -RemoteHost $StackItServiceDiscoveryDbRemoteHost    
}

function Start-IdentityServerCfTunnel {
    Start-CFTunnel -RemoteHost $StackItIdentityServerDbRemoteHost    
}

function Start-CFTunnel {
    param (
        [string] $RemoteHost
    )
    
    Start-Process cf -ArgumentList "ssh session -L 3306:${RemoteHost}:3306"
}
