function Get-TdxAsset
{
    [CmdletBinding()]
    param
    (
        # Retrieve a single asset by its ID.  Using this parameter returns information that is not returned when using the other parameter sets, such as custom attributes.
        [Alias("ID")]
        [Parameter(
            ParameterSetName = "IDLookup",
            Mandatory = $true,
            Position = 0
        )]
        [int]
        $AssetID,

        # Return multiple assets by one or more criteria.
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "SearchObject",
            Position = 0
        )]
        [System.Collections.IDictionary]
        $SearchObject,

        # LIKE search on serial number and tag
        [Alias("Serial")]
        [Parameter(
            Mandatory = $False,
            ParameterSetName = "SearchParameters"
        )]
        [string]
        $SerialLike,

        # Sets whether to look at production assets or sandbox assets.
        [Alias("Sb")]
        [Parameter(
            Mandatory = $false
        )]
        [switch]
        $Sandbox
    )

    begin
    {
        $BaseUriLeaf = "/733/assets"
        $Splat = @{}
        $SearchParameters = @{}

        $Splat["Sandbox"] = $Sandbox

        if ($PSCmdlet.ParameterSetName -eq "IDLookup")
        {
            $Splat["Method"] = [Microsoft.PowerShell.Commands.WebRequestMethod]::Get
            $Splat["UriLeaf"] = "$BaseUriLeaf/$AssetID"
        }

        elseif ($PSCmdlet.ParameterSetName -eq "SearchParameters")
        {
            if ($PSBoundParameters.ContainsKey("SerialLike")) {$SearchParameters["SerialLike"] = $SerialLike}

            $Splat["Method"] = [Microsoft.PowerShell.Commands.WebRequestMethod]::Post
            $Splat["UriLeaf"] = "$BaseUriLeaf/search"
            $Splat["Body"] = $SearchParameters | ConvertTo-Json -Depth 10
        }

        elseif ($PSCmdlet.ParameterSetName -eq "SearchObject")
        {
            $Splat["Method"] = [Microsoft.PowerShell.Commands.WebRequestMethod]::Post
            $Splat["UriLeaf"] = "$BaseUriLeaf/search"
            $Splat["Body"] = $SearchObject | ConvertTo-Json -Depth 10
        }

    }

    process
    {
        Invoke-TdxMethod @Splat
    }

    end
    {

    }
}