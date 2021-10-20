Import-Module "$PSScriptRoot\PS_SCMFunctions.ps1" -Force
Import-Module "$PSScriptRoot\PS_NugetFunctions.ps1" -Force
Import-Module "$PSScriptRoot\PS_BuildHelperFunctions.ps1" -Force
# project related
Import-Module "$PSScriptRoot\PS_StackItFunctions.ps1" -Force
Import-Module "$PSScriptRoot\PS_LidlTravelFunctions.ps1" -Force

# Needed for sam build command
function Set-Utf8OutputEncoding {
    [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
}

# accessories

function Convert-Base64ToFile {
    [CmdletBinding()]
    param (
        # Base64 encoded input string
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)] [string] $Base64,
        [Parameter(Mandatory=$true)][string] $Path
    )
    process {
        [System.IO.File]::WriteAllBytes($Path, $([System.Convert]::FromBase64String($Base64)))
    }
}

function Compare-FileHash {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)][string[]] $Path,
        [Parameter(Mandatory=$true)] [string] $Hash,
        [Parameter()][string] $Algorithm = "SHA256"
    )
    process {
        $parameter = @{ Path = $Path; Algorithm = $Algorithm }
        Get-FileHash @parameter | 
            Select-Object -ExpandProperty Hash | 
            Compare-Object -ReferenceObject $Hash -IncludeEqual
    }
}