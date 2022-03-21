function Convert-Base64ToFile {
    <#
.SYNOPSIS
    Convert Base64 string to file
.DESCRIPTION
    Export base64 encoded files
.EXAMPLE
    PS C:\> Convert-Base64ToFile -Base64 "<Base64>" -Path "<FileName>"
    Generate File ".\FileName" from Base64 input
.INPUTS
    Base64
    Path
.OUTPUTS
    File
.NOTES
    This is currently under Test
#>
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

function ConvertFrom-Base64 {
    [CmdletBinding()]
    param (
        # Base64 encoded input string
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)] [string] $Base64
    )
    process {
        [System.Text.Encoding]::Default.GetString([System.Convert]::FromBase64String($Base64))
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