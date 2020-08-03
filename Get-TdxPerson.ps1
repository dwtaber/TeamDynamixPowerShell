function Get-TdxPerson {
    [CmdletBinding()]
    param
    (
        #Returns a single user with the specified GUID.
        #Returns information that is not returned when using the other parameter sets, e.g. custom attributes.
        [Alias("Uid","ID")]
        [Parameter(
            ParameterSetName = "Guid",
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [guid]
        $Guid,

        [Parameter(
            ParameterSetName = "SearchParameters",
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string]
        $SearchText,

        # Return multiple assets by one or more criteria.
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "SearchObject",
            Position = 0
        )]
        [System.Collections.IDictionary]
        $SearchObject,

        [Alias("Sb")]
        [Parameter(
            Mandatory = $false
        )]
        [switch]
        $Sandbox
    )

    begin
    {
        $BaseUriLeaf = "/People"
        $Splat = @{}
        $SearchParameters = @{}

        if ($PSCmdlet.ParameterSetName -eq "Guid")
        {
            $Splat["Method"] = [Microsoft.PowerShell.Commands.WebRequestMethod]::Get
            $Splat["UriLeaf"] = "$BaseUriLeaf/$($Guid.Guid)"
        }

        elseif ($PSCmdlet.ParameterSetName -eq "SearchParameters")
        {
            if ($PSBoundParameters.ContainsKey("SearchText")) {$SearchParameters["SearchText"] = $SearchText}

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

    end {}
}