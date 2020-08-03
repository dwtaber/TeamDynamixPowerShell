#Derived from the PSCredential supplied to New-TdxToken
#Used for both production and sandbox
New-Variable -Name TdxUserName
New-Variable -Name TdxCredential

#String for most recent JWT and JWT in an authorization header; applies to both production and sandbox
New-Variable -Name TdxToken
New-Variable -Name TdxHeaders

#Contain the base URI for production and sandbox, respectively
New-Variable -Name TdxUriBase
New-Variable -Name SbUriBase

#Approximation only; not extracted from JWT for now
New-Variable -Name TdxTokenExpiry

. $PSScriptRoot\TicketEnums.ps1
. $PSScriptRoot\CheckSandbox.ps1
. $PSScriptRoot\Invoke-TdxMethod.ps1
. $PSScriptRoot\SearchParametersToJson.ps1
. $PSScriptRoot\New-TdxToken.ps1
. $PSScriptRoot\Get-TdxScriptVariables.ps1
. $PSScriptRoot\Get-TdxAsset.ps1
. $PSScriptRoot\Get-TdxPerson.ps1