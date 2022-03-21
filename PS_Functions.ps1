Import-Module "$PSScriptRoot\PS_SCMFunctions.ps1" -Force
Import-Module "$PSScriptRoot\PS_NugetFunctions.ps1" -Force
Import-Module "$PSScriptRoot\PS_BuildHelperFunctions.ps1" -Force
Import-Module "$PSScriptRoot\PS_SecurityHelperFunctions.ps1" -Force
# project related
Import-Module "$PSScriptRoot\PS_StackItFunctions.ps1" -Force
Import-Module "$PSScriptRoot\PS_LidlTravelFunctions.ps1" -Force

# Needed for sam build command
function Set-Utf8OutputEncoding {
    [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
}
