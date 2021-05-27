# gitIgnore powershell wrapper
New-Alias -Name "gig" -Value Invoke-GitIgnoreProfileRequest -Description "Request language specific .gitignore templates"


New-Alias -Name "scfs" -Value Start-SessionCFTunnel
New-Alias -Name "scfsd" -Value Start-ServiceDiscoveryCfTunnel
New-Alias -Name "scfis" -Value Start-IdentityServerCfTunnel

#--- Docker ----------------------------------------
New-Alias -Name "dstrt" -Value "docker.exe start"
New-Alias -Name "drun" -Value "docker.exe run"