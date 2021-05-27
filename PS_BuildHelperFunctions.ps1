<#
    helper for code topics
#>
function Clear-Project {
    [CmdletBinding()]
    param (
        # Base64 encoded input string
        [Parameter(ValueFromPipeline=$true)][System.IO.DirectoryInfo[]] $Path = $(Get-ChildItem -Directory),
        [switch] $WhatIf
    )
    process {
        $cleanup = $Path | Get-ChildItem -Recurse -Directory -filter "bin"
        $cleanup += $Path | Get-ChildItem -Recurse -Directory -filter "obj" 
        
        $cleanup | Sort-Object -Property FullName | Remove-Item -Recurse -Force @PSBoundParameters
    }
}