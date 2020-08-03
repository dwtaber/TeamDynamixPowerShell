# Issue with either this function or how it was being used in functions.  Need to investigate and fix before using.

function Script:SearchParametersToJson
{
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
}