# NuGet Commands

function Invoke-PreReleaseBuild {
    <#
.SYNOPSIS
    Invokes dotnet pack command and adds a pre release build number
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
    param (
        [Parameter(Mandatory=$true)][string] $Project,
        [string] $Output,
        [switch] $LongBuildNumber
    )
    $today = Get-Date;
    $buildNumbers = @();
    if($LongBuildNumber){
        $buildNumbers += $today.Day.ToString();
    }
    $buildNumbers += $today.TimeOfDay.TotalSeconds.ToString("F0");
    $tmpBuildNumber = [string]::Join('.',$buildNumbers);

    $arguments = @("pack", $Project, "--version-suffix", $tmpBuildNumber);

    if(-not [string]::IsNullOrEmpty($Output)){
        $arguments += @("--output", $Output);
    }    
    & dotnet.exe $arguments;
}

function Invoke-ReleaseBuild {
    <#
.SYNOPSIS
    Invokes dotnet pack command and adds a pre release build number
.DESCRIPTION
    Long description
.EXAMPLE
    PS C:\> <example usage>
    Explanation of what the example does
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    General notes
#>
    param (
        [Parameter(Mandatory=$true)][string] $Project,
        [string] $Output
    )
    $arguments = @("pack", $Project);

    if(-not [string]::IsNullOrEmpty($Output)){
        $arguments += @("--output", $Output);
    }    
    & dotnet.exe $arguments;
}