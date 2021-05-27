# gitIgnore powershell wrapper
# For PowerShell v3

function Get-CurrentPath {
  Get-Location | Select-Object -ExpandProperty Path
}

function Invoke-GitIgnoreProfileRequest {
    param(
      [Parameter(Mandatory=$true)]
      [string[]]$list
    )
    $params = ($list | ForEach-Object { [uri]::EscapeDataString($_) }) -join ","
    Invoke-WebRequest -Uri "https://www.toptal.com/developers/gitignore/api/$params" | Select-Object -ExpandProperty content | Out-File -FilePath $(Join-Path -path $pwd -ChildPath ".gitignore") -Encoding ascii
}

function Invoke-GitPull {
  Write-Information "Pull on $(Get-CurrentPath)"
  & git pull --all
}

function Invoke-GitPullRepository {
  param (
    [Parameter(ValueFromPipeline=$true)][string]$Path = $(Get-Location)
  )
  process{
    Write-Debug -Message "Process `"$Path`"." 
    Push-Location $Path
    Invoke-GitPull
    Pop-Location
  }
}

function Invoke-GitPullAll {
  param (
    [Parameter(ValueFromPipeline=$true)][string]$Path = $(Get-Location)
  )
  process{
    Write-Debug -Message "Process `"$Path`"."
    $Path | Get-ChildItem -Directory | Invoke-GitPullRepository
  }
  end{
    Write-Output -Message "Update complete."
  }
}

function Invoke-GitFetch {
  Write-Information "Fetch on $(Get-CurrentPath)"
  & git fetch --all
}

function Invoke-GitFetchRepository {
  param (
    [Parameter(ValueFromPipeline=$true)][string]$Path = $(Get-Location)
  )
  process{
    Write-Debug -Message "Process `"$Path`"." 
    Push-Location $Path
    Invoke-GitFetch
    Pop-Location
  }
}

function Invoke-GitFetchAll {
  param (
    [Parameter(ValueFromPipeline=$true)][string]$Path = $(Get-Location)
  )
  process{
    Write-Debug -Message "Process `"$Path`"."
    $Path | Get-ChildItem -Directory | Invoke-GitFetchRepository
  }
  end{
    Write-Output -Message "Update complete."
  }
}