function Invoke-TdxMethod
{
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory = $false
        )]
        [Microsoft.PowerShell.Commands.WebRequestMethod]
        $Method = [Microsoft.PowerShell.Commands.WebRequestMethod]::Default,

        [Parameter(
            Mandatory = $true
        )]
        [Alias("Uri")]
        [string]
        $UriLeaf,

        [Parameter(
            Mandatory = $false
        )]
        [System.Object]
        $Body,

        [Parameter(
            Mandatory = $false
        )]
        [switch]
        $Sandbox
    )

    begin
    {
        if ($UriLeaf[0] -ne "/") {$UriLeaf = $UriLeaf.Insert(0,"/")}
        $Uri = "$(CheckSandbox)$UriLeaf"

        $RestSplat = @{
            ContentType = "Application/Json"
            Headers = $Script:TdxHeaders
            Method = $Method
            Uri = $Uri
        }
        if ($PSBoundParameters.ContainsKey("Body")) {$RestSplat["Body"] = $Body}
    }

    process
    {
        Invoke-RestMethod @RestSplat
    }

    end
    {}
}