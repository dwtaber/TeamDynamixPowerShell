using namespace System.Collections.Generic

# Issue with either this function or how it was being used in functions.  Need to investigate and fix before using.

function Script:SearchParametersToJson
{
<#
    param
    (
        [Parameter()]
        [string]
        $ParameterSetName = "SearchParameters"
    )
    $ParameterSet =
        $MyInvocation.MyCommand.ParameterSets.Parameters |
        Where-object {$_.Attributes.ParameterSetName -eq $ParameterSetName} |
        Select-Object -ExpandProperty "Name"

    $ParameterSetHashtable = @{}
    $PSBoundParameters.GetEnumerator() |
        Where-Object {$_.Key -in $ParameterSet} |
        ForEach-Object {$ParameterSetHashtable.Add($_.Key,$_.Value)}

    $SearchParameterJson = $ParameterSetHashtable | ConvertTo-Json -Depth 10

    return $SearchParameterJson
#>

    param (
        [Parameter(
            Mandatory = $true,
            Position = 0
        )]
        [Dictionary[[string],[string]]]
        $CmdletToApiDictionary
    )

    $hash = @{}

    $boundParams = (Get-Variable PSBoundParameters -Scope 1).Value

    Write-Verbose "Bound Parameters `r`n$boundParams"

    foreach ($param in $CmdletToApiDictionary.Keys)
    {
        if ($boundParams.ContainsKey($param))
        {
            $hash[$CmdletToApiDictionary[$param]] = $boundParams[$param]
        }
    }

    $json = $hash | ConvertTo-Json -Depth 10

    return $json

}