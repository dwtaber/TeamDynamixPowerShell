function Get-TdxTicket
{
    [CmdletBinding()]
    param
    (
        # Retrieve a single ticket by its ID.
        # Returns information that is not returned when using the other parameter sets, such as custom attributes.
        [Alias("ID")]
        [Parameter(
            ParameterSetName = "IDLookup",
            Mandatory = $true,
            Position = 0
        )]
        [int]
        $TicketID,

        # Return multiple tickets by one or more criteria.
        [Parameter(
            Mandatory = $true,
            ParameterSetName = "SearchObject",
            Position = 0
        )]
        [System.Collections.IDictionary]
        $SearchObject,

        # String search in title, description, custom attribute, reference code, and feed fields.
        # Comparable to search in TDX web UI.
        [Parameter(
            ParameterSetName = "SearchParameters",
            Mandatory = $true,
            Position = 0,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string]
        $SearchText,

        # Sets whether to look at production tickets or sandbox tickets.
        [Alias("Sb")]
        [Parameter(
            Mandatory = $false
        )]
        [switch]
        $Sandbox
    )

    begin
    {
        $BaseUriLeaf = "/362/tickets"
        $Splat = @{}
        $SearchParameters = @{}

        if ($PSCmdlet.ParameterSetName -eq "IDLookup")
        {
            $Splat["Method"] = [Microsoft.PowerShell.Commands.WebRequestMethod]::Get
            $Splat["UriLeaf"] = "$BaseUriLeaf/$TicketID"
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

    end
    {

    }
}